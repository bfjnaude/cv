
build:
	pandoc -s --template template.html --toc -c css/bootstrap.css index.md -o index.html --metadata pagetitle='Francois Naude'

pdf:
	pandoc -t html index.html -o  index.pdf 

deploy:
	aws s3 sync ~/cv/ s3://cv.bfjnaude.com --exclude ".git*" \
		--exclude "Makefile" \
		--exclude "*.code-workspace" \
		--exclude "template.html" \
		--exclude "*.md" \
		--profile bfjnaudebackups --delete --acl public-read
