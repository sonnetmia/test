app = search(:aws_opsworks_app).first
app_path = "/srv/#{app['shortname']}"

package "git" do
  options "--force-yes" if node["platform"] == "ubuntu" && node["platform_version"] == "16.04"
end

application app_path do
  git app_path do
    repository app["app_source"]["url"]
    revision app["app_source"]["revision"]
  end
end

