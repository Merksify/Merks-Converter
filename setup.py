from setuptools import setup

setup(
    name="merks-converter",
    version="1.0.0",
    py_modules=["main"],
    install_requires=[
        "Pillow>=9.0.0",
    ],
    entry_points={
        "console_scripts": [
            "convert-merks=main:main",
            "convert_merks=main:main",
        ],
    },
    author="Merksify",
    description="A simple terminal drag-and-drop file converter",
    python_requires=">=3.6",
)
