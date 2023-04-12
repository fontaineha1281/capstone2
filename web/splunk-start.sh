#!/bin/bash

# Chạy Splunk
${SPLUNK_HOME}/bin/splunk start --accept-license --no-prompt

# Chờ Splunk khởi động hoàn toàn
while ! ${SPLUNK_HOME}/bin/splunk status | grep -q "splunkd is running"; do
  sleep 2
done

# Cấu hình Splunk để chạy với quyền root (khuyến khích trong container)
${SPLUNK_HOME}/bin/splunk edit user admin -password haduyanh -role admin -auth admin:changeme

# Dừng Splunk
${SPLUNK_HOME}/bin/splunk stop

# Chạy Splunk lại với quyền root
${SPLUNK_HOME}/bin/splunk start --accept-license --no-prompt --answer-yes --seed-passwd haduyanh

# Để Splunk chạy ngầm trong container
${SPLUNK_HOME}/bin/splunk enable boot-start -user root

# Giữ container chạy
tail -f /dev/null







