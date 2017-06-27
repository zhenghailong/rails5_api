Doorkeeper::OpenidConnect.configure do
  issuer 'issuer string'

  jws_private_key <<-EOL
-----BEGIN RSA PRIVATE KEY-----
MIIEjgIBAAKB/gDZ7YDWuahkPcz3VZoAWusiDC0AFsya3pfYdDCtCuHXRx7Q2qKZ
nWTIdY0Holds5wrpm15HOhN5D/UdTEPiVIXmOdnXqtZ32q0lhxCQOa+ZkMS2XvVr
fwh7ws4scQStuwG229vw4dbqrj/8YsAlOJHhuaLXfz+qIcyxjHGMGAu/mx18J1T7
v+scN7xvEJYHybwY9mBisxl7eLmprEf6U5bk7REB5szSqIv4e+fEJTflSDKiWxda
EnHfbHHTV9DG0S+1MIXOEm1FytqRhzo5o//QnKDcvCtgZy7wXUO9NBbSzrE1KktC
DPYThwP3rbT6sJHy3CGZf38EHEX0id+bAgMBAAECgf00XA3yiVTeEMMoQdbocu+/
  lHFTbibmpsiQ5wmy6cRtNtc+kukyQ1CtoSCrTuP2dGR40C2Mq3V2RtE7otFElc4+
  DHQ8jv1MeqvTMmpWXKXGHbRFpPcORs1A/wMORnE7VI0K5DQp4fkDFa6l8wv7ZWYX
d8SaRiaDt+84UWgOotBYtodZT+FuZCJBBZ58CYTvTQe8U06J541BFleZcRELLfTA
vYRlmOhcRFRWCGiAkF8nsdVjNwjDVjCTHWxRUK24QDB5eqa9/o2fl/cWKfLRaw4d
kI89Sro+2GeynDDfWcw/EEXSrhwWyFkmAg9zcJ0NcBQ3ifjh40d90LbuNo8RAn8P
EY+DUYrVje04GsyLA20+pmlO34BFY0we5TuSJDCsUxc/4K8oSBnVk7w0oxmPe2KS
fzLsMktCrPMlMNmO4VtHKjPfwc5VO0GGf6XZ26ABmpuT80lbjI8Hy4jCgPlGb5lM
kvacJW2hnC0h/EUgigiKuS80UeTyb3aOORc2vprnAn8Odl5368ItpggVFaEDGrPo
vonyhcYt7RBuoRK6GgxgEJAN1/rrD1YBdbM1vTDHbWPn42q84iPQZetPcxvyLjlD
d15EAHNfZEwhiCmo7HTNlKp+j5NvNH7kta+PUDgygVGEFCy/IQt1xa+TObD/IhrU
OleY8ry0Iaq7JMFwepMtAn8Ei/jw1+b7f0LH/hYgEB2jnNUDzp7G0SqD3Al4lGD3
bm8CgEp57h+VeWl9vIUW7VUV/TmhWZ+p88O+Qhozab6AH7TdXH5k62dfLR8fOIz0
TvGI2A0XibcS1BBlGEOfREdOer3c6dJFxHk92wAEzIG9UhlzQQ7DNGzih0mA5Eyb
An8Ddhbz8ovdqwACM9P+TzTBvmB7l8KvmS42m/xEaBmQIEap2YgnG9uEq+vBL89t
22Nuy0HvhNv3c30W3cDRfHieCgKYmdcC/Jkv6Uu3LyhhT3Rip/AsTE8WY9lpnlRk
2ghtaPqwn7MDc9WqkcMnvLzZEEGIzIeXQPuAoLJfPibdAn8JcRNhy4eq/qussR/r
OQ8n4g9K6UR3Ks/QHJqBjBVLYLAiYMh5CEc0hcojAAyKL1Zf3h1gG/p8d7nGJpZW
YK4IzsJGG88zyM6OgSCG30zUh7Qn1QFhXJOP2C1h8yv0SkNLIOenIZxVzwDXGltF
fBlWN/MWattS25cFpZbYsv6t
-----END RSA PRIVATE KEY-----
EOL

  resource_owner_from_access_token do |access_token|
    # Example implementation:
    User.find_by(id: access_token.resource_owner_id)
  end

  auth_time_from_resource_owner do |resource_owner|
    # Example implementation:
    # resource_owner.current_sign_in_at
    DateTime.now
  end

  reauthenticate_resource_owner do |resource_owner, return_to|
    # Example implementation:
    # store_location_for resource_owner, return_to
    # sign_out resource_owner
    # redirect_to new_user_session_url
  end

  subject do |resource_owner|
    # Example implementation:
    # resource_owner.key
  end

  # Protocol to use when generating URIs for the discovery endpoint,
  # for example if you also use HTTPS in development
  protocol do
    :https
  end

  # Expiration time on or after which the ID Token MUST NOT be accepted for processing. (default 120 seconds).
  # expiration 600

  # Example claims:
  # claims do
  #   normal_claim :_foo_ do |resource_owner|
  #     resource_owner.foo
  #   end

  #   normal_claim :_bar_ do |resource_owner|
  #     resource_owner.bar
  #   end
  # end
end
