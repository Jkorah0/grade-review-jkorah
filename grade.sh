CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
if [[ -f $1 ]] && [[ $1 != "ListExamples.java" ]]
then
echo "Wrong file submitted."
exit
else
echo "Right File Submitted"
cp student-submission/ListExamples.java grading-area
cp TestListExamples.java grading-area
cp -r lib grading-area
cd grading-area
javac -cp ".;lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java"
if [[ $? == 1 ]]
then
echo "Compile Error in Submission"
exit
else
java -cp ".;lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples"
status=$?
if [[ $status == 0 ]]
then
echo "Test Passed"
elif [[ $status == 1 ]]
then
echo "Test Failed"
else
echo "Exit Code"
fi
fi
fi