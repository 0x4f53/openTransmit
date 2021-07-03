import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="openTransmit",
    version="0.0.1",
    author="Owais Shaikh",
    author_email="0x4f@tuta.io",
    description="Locally access your computer from iOS' Files App.",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/4f77616973/openTransmit",
    packages=setuptools.find_packages(),
    classifiers=(
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: GPLv3 License",
        "Operating System :: Linux",
    ),
) 
