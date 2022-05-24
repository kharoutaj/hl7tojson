#!/bin/zsh
rm -rf dist
python setup.py sdist bdist_wheel

# Update to testing domain
twine upload --repository testpypi dist/*

# Update to real domain
# twine upload dist/*
