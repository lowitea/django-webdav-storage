project_name=django_webdav_storage

test:
	python setup.py develop
	python setup.py test
	python setup.py develop --uninstall


release:
	python setup.py sdist --format=zip,bztar,gztar
	python setup.py bdist_wheel
	python setup.py register upload


flake8:
	flake8 --max-complexity 12 ${project_name}


coverage:
	make clean
	python setup.py develop
	coverage run --rcfile=.coveragerc --include=${project_name}/* setup.py test
	coverage html
	python setup.py develop --uninstall


clean:
	python setup.py develop --uninstall
	rm -rf *.egg-info *.egg
	rm -rf htmlcov
	rm -f .coverage
	find . -name "*.pyc" -exec rm -rf {} \;


coveralls:
	coveralls
