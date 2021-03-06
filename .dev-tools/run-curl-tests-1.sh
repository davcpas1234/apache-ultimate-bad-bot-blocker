#!/bin/bash
# Curl Testing Script for Apache Ultimate Bad Bot Blocker
# Created by: Mitchell Krog (mitchellkrog@gmail.com)
# Copyright: Mitchell Krog - https://github.com/mitchellkrogza
# Repo Url: https://github.com/mitchellkrogza/apache-ultimate-bad-bot-blocker

##############################################################################
#        ___                 __                                              #
#       / _ | ___  ___ _____/ /  ___                                         #
#      / __ |/ _ \/ _ `/ __/ _ \/ -_)                                        #
#     /_/ |_/ .__/\_,_/\__/_//_/\__/                                         #
#        __/_/        __   ___       __     ___  __         __               #
#       / _ )___ ____/ /  / _ )___  / /_   / _ )/ /__  ____/ /_____ ____     #
#      / _  / _ `/ _  /  / _  / _ \/ __/  / _  / / _ \/ __/  '_/ -_) __/     #
#     /____/\_,_/\_,_/  /____/\___/\__/  /____/_/\___/\__/_/\_\\__/_/        #
#                                                                            #
##############################################################################

# *******************************************
# Set Location of our Curl Test Results Files
# *******************************************

curltest1=${TRAVIS_BUILD_DIR}/.dev-tools/_curl_tests/curltest1.txt
curltest2=${TRAVIS_BUILD_DIR}/.dev-tools/_curl_tests/curltest2.txt
curltest3=${TRAVIS_BUILD_DIR}/.dev-tools/_curl_tests/curltest3.txt
curltest4=${TRAVIS_BUILD_DIR}/.dev-tools/_curl_tests/curltest4.txt
curltest5=${TRAVIS_BUILD_DIR}/.dev-tools/_curl_tests/curltest5.txt
curltest6=${TRAVIS_BUILD_DIR}/.dev-tools/_curl_tests/curltest6.txt
curltest7=${TRAVIS_BUILD_DIR}/.dev-tools/_curl_tests/curltest7.txt
curltest8=${TRAVIS_BUILD_DIR}/.dev-tools/_curl_tests/curltest8.txt
curltest9=${TRAVIS_BUILD_DIR}/.dev-tools/_curl_tests/curltest9.txt
curltest10=${TRAVIS_BUILD_DIR}/.dev-tools/_curl_tests/curltest10.txt
curltest11=${TRAVIS_BUILD_DIR}/.dev-tools/_curl_tests/curltest11.txt

now="$(date)"

# *************************************************
# Function Curl Test 1 - Check for Bad Bot "80legs"
# *************************************************

run_curltest1 () {
truncate -s 0 ${curltest1}
printf '%s%s\n\n' "Last Tested: " "${now}" >> "${curltest1}"
curl -A "80legs" http://local.dev:80/index.html 2>&1 >> ${curltest1}
if grep -i 'Forbidden' ${curltest1}; then
   echo 'BAD BOT DETECTED - TEST PASSED'
else
   echo 'BAD BOT NOT DETECTED - TEST FAILED'
   exit 1
fi
}

# **************************************************
# Function Curl Test 2 - Check for Bad Bot "masscan"
# **************************************************

run_curltest2 () {
truncate -s 0 ${curltest2}
printf '%s%s\n\n' "Last Tested: " "${now}" >> "${curltest2}"
curl -A "masscan" http://local.dev:80/index.html 2>&1 >> ${curltest2}
if grep -i 'Forbidden' ${curltest2}; then
   echo 'BAD BOT DETECTED - TEST PASSED'
else
   echo 'BAD BOT NOT DETECTED - TEST FAILED'
   exit 1
fi
}

# ******************************************************************
# Function Curl Test 3 - Check for Bad Referrer "100dollars-seo.com"
# ******************************************************************

run_curltest3 () {
truncate -s 0 ${curltest3}
printf '%s%s\n\n' "Last Tested: " "${now}" >> "${curltest3}"
curl -I http://local.dev:80/index.html -e http://100dollars-seo.com 2>&1 >> ${curltest3}
if grep -i 'Forbidden' ${curltest3}; then
   echo 'BAD REFERRER DETECTED - TEST PASSED'
else
   echo 'BAD REFERRER NOT DETECTED - TEST FAILED'
   exit 1
fi
}

# ******************************************************
# Function Curl Test 4 - Check for Bad Referrer "zx6.ru"
# ******************************************************

run_curltest4 () {
truncate -s 0 ${curltest4}
printf '%s%s\n\n' "Last Tested: " "${now}" >> "${curltest4}"
curl -I http://local.dev:80/index.html -e http://zx6.ru 2>&1 >> ${curltest4}
if grep -i 'Forbidden' ${curltest4}; then
   echo 'BAD REFERRER DETECTED - TEST PASSED'
else
   echo 'BAD REFERRER NOT DETECTED - TEST FAILED'
   exit 1
fi
}

# *****************************************************
# Function Curl Test 5 - Check for Good Bot "GoogleBot"
# *****************************************************

run_curltest5 () {
truncate -s 0 ${curltest5}
printf '%s%s\n\n' "Last Tested: " "${now}" >> "${curltest5}"
curl -v -A "GoogleBot" http://local.dev:80/index.html 2>&1 >> ${curltest5}
if grep -i 'Welcome' ${curltest5}; then
   echo 'GOOD BOT ALLOWED THROUGH - TEST PASSED'
else
   echo 'GOOD BOT NOT ALLOWED THROUGH - TEST FAILED'
   exit 1
fi
}

# ***************************************************
# Function Curl Test 6 - Check for Good Bot "BingBot"
# ***************************************************

run_curltest6 () {
truncate -s 0 ${curltest6}
printf '%s%s\n\n' "Last Tested: " "${now}" >> "${curltest6}"
curl -v -A "BingBot" http://local.dev:80/index.html 2>&1 >> ${curltest6}
if grep -i 'Welcome' ${curltest6}; then
   echo 'GOOD BOT ALLOWED THROUGH - TEST PASSED'
else
   echo 'GOOD BOT NOT ALLOWED THROUGH - TEST FAILED'
   exit 1
fi
}


# **************************************************
# Function Curl Test 7 - Check for Bad Bot "Disco"
# **************************************************

run_curltest7 () {
truncate -s 0 ${curltest7}
printf '%s%s\n\n' "Last Tested: " "${now}" >> "${curltest7}"
curl -A "Disco" http://local.dev:80/index.html 2>&1 >> ${curltest7}
if grep -i 'Forbidden' ${curltest7}; then
   echo 'BAD BOT DETECTED - TEST PASSED'
else
   echo 'BAD BOT NOT DETECTED - TEST FAILED'
   exit 1
fi
}

# *******************************************************
# Function Curl Test 8 - Check for Bad Bot "Discoverybot"
# *******************************************************

run_curltest8 () {
truncate -s 0 ${curltest8}
printf '%s%s\n\n' "Last Tested: " "${now}" >> "${curltest8}"
curl -A "Discoverybot" http://local.dev:80/index.html 2>&1 >> ${curltest8}
if grep -i 'Forbidden' ${curltest8}; then
   echo 'BAD BOT DETECTED - TEST PASSED'
else
   echo 'BAD BOT NOT DETECTED - TEST FAILED'
   exit 1
fi
}

# ****************************************************
# Function Curl Test 9 - Check for Bad Bot "Disco Bot"
# ****************************************************

run_curltest9 () {
truncate -s 0 ${curltest9}
printf '%s%s\n\n' "Last Tested: " "${now}" >> "${curltest9}"
curl -A "Disco Bot" http://local.dev:80/index.html 2>&1 >> ${curltest9}
if grep -i 'Forbidden' ${curltest9}; then
   echo 'BAD BOT DETECTED - TEST PASSED'
else
   echo 'BAD BOT NOT DETECTED - TEST FAILED'
   exit 1
fi
}

# ******************************************************
# Function Curl Test 10 - Check for Bad Bot "Web Bandit"
# ******************************************************

run_curltest10 () {
truncate -s 0 ${curltest10}
printf '%s%s\n\n' "Last Tested: " "${now}" >> "${curltest10}"
curl -A "Web Bandit" http://local.dev:80/index.html 2>&1 >> ${curltest10}
if grep -i 'Forbidden' ${curltest10}; then
   echo 'BAD BOT DETECTED - TEST PASSED'
else
   echo 'BAD BOT NOT DETECTED - TEST FAILED'
   exit 1
fi
}

# *****************************************************
# Function Curl Test 11 - Check for Bad Bot "WebBandit"
# *****************************************************

run_curltest11 () {
truncate -s 0 ${curltest11}
printf '%s%s\n\n' "Last Tested: " "${now}" >> "${curltest11}"
curl -A "WebBandit" http://local.dev:80/index.html 2>&1 >> ${curltest11}
if grep -i 'Forbidden' ${curltest11}; then
   echo 'BAD BOT DETECTED - TEST PASSED'
else
   echo 'BAD BOT NOT DETECTED - TEST FAILED'
   #exit 1
fi
}

# *********************************
# Trigger our curl functions to run
# *********************************

run_curltest1
run_curltest2
run_curltest3
run_curltest4
run_curltest5
run_curltest6
run_curltest7
run_curltest8
run_curltest9
run_curltest10
run_curltest11

# ****************************************
# If everything passed then we exit with 0
# ****************************************

exit 0

