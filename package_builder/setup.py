from setuptools import setup

package = 'package-builder'
version = '0.1'

INSTALL_REQUIRES = ['GitPython', 'sh']

setup(name=package,
      version=version,
      install_requires=INSTALL_REQUIRES,
      description="Simple Python package builder",
      url='url')
