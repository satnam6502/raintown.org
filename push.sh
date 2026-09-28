# Deploy the built site to the DigitalOcean droplet oban.raintown.org.
# No --delete: the server hosts pages not in this repo (e.g. /talks/) that a
# mirroring sync would remove.
rsync -azP _site/ satnam@oban.raintown.org:public_html
