# Utils

## Script for unzipping/moving code reviews to a common location.

The script assumes that env variables for CODE_DOWNLOAD_PATH and CODE_REVIEW_PATH are set.
**_CODE_DOWNLOAD_PATH_**: Path where code has been downloaded e.g: **_/Users/yourusername/Downloads_**
**_CODE_REVIEW_PATH_**: Path where you want to store your code reviews e.g: **_/Users/yourusername/Documents/Work/code_reviews_**
Setting env variables:

**set env variables(CODE_DOWNLOAD_PATH, CODE_REVIEW_PATH) in your .bashrc or .zshrc to point to the respective path.**

Executing the script:
Format:
```bash
./mv_code_review.sh NAME_OF_THE_LANGUAGE NAME_OF_THE_CANDIDATE NAME_OF_THE_DOWNLOADED_FILE
```
Examples:
1) With ZIP:
```bash
./mv_code_review.sh RUBY YUKIHIRO_MATSUMOTO code_assignment.zip
```
2) If it is already extracted in a folder:
```bash
./mv_code_review.sh JAVA JAMES_GOSLING code_assignment
```
