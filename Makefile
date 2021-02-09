
build:
	pandoc -s --template template.html --toc -c css/bootstrap.css index.md -o cv.html --metadata pagetitle='Francois Naude'

deploy:
	aws s3 sync ~/Documents/cv/ s3://cv.bfjnaude.com --exclude ".git*" \
		--exclude "Makefile" \
		--exclude "*.code-workspace" \
		--exclude "template.html" \
		--exclude "*.md" \
		--exclude "*.tex" \
		--exclude "*.aux" \
		--exclude "*.log" \
		--exclude "*.gz" \
		--delete --acl public-read
