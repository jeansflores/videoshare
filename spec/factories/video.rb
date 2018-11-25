FactoryBot.define do
  factory :video do
    name    { FFaker::Lorem.word }
    url     { 'http://content.jwplatform.com/manifests/yp34SRmf.m3u8' }
    views   { 0 }
    user    { create(:user) }
  end
end
