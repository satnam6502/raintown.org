# No --delete: the server hosts pages not in this repo (e.g. /talks/) that a
# mirroring sync would remove.
rsync -azP _site/ raintow@raintown.org:domains/raintown.org/public_html
