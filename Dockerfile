FROM inspec/inspec-azure

COPY app/index.sh /index.sh

ENTRYPOINT ["/index.sh"]