# Chaturbate MyPy

## Usage (docker)

### Build docker image
Change into `cb-scripts` directory and use `./cb-mypy-build.sh cb_dir` where `cb_dir` is the (absolute) path to your local chaturbate repo. Alternatively copy `cb_dir/requirements.txt` to this repo's root folder as `cb_requirements.txt` pass an empty string or other placeholder to the build script.

### Run docker container
Change into `cb-scripts` directory and use `./cb-mypy.sh cb_dir` where `cb_dir` is the (absolute) path to your local chaturbate repo. Alternatively pass a volume path from another docker container that leads to the chaturbate root directory there.