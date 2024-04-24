#!/bin/bash

pigar gen \
-f requirements.txt \
--auto-select \
--question-answer yes \
../

# Remove commments and empty lines
sed -i.bak '/^WARNING/d' requirements.txt
sed -i.bak '/^#/d' requirements.txt
sed -i.bak '/^$/d' requirements.txt

# Remove packages which do not work
sed -i.bak '/^psycopg2/d' requirements.txt

rm requirements.txt.bak