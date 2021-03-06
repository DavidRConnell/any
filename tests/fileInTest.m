classdef fileInTest < matlab.unittest.TestCase

	properties
		testDir = './tmp/';
		numFilesInDir = 10;
	end

	methods (TestClassSetup)
		function setupTestDirectory(testCase)
			mkdir(testCase.testDir);
			testCase.addTeardown(@system, ['rm -r ' testCase.testDir]);
			utils.generateFakeFiles(testCase.numFilesInDir, testCase.testDir);
		end
	end

	methods (Test, TestTags = {'Unit'})
		function testReturnsSingleRandomFile(testCase)
			filename = any.fileIn(testCase.testDir);
			testCase.verifyTrue(ismember(filename, utils.listFiles(testCase.testDir)))
		end

		function testReturnsMultipleRandomFiles(testCase)
			filesToGet = randi([2 testCase.numFilesInDir]);
			files = any.fileIn(testCase.testDir, filesToGet);

			testCase.verifyTrue(all(ismember(files, utils.listFiles(testCase.testDir))))
			testCase.verifyLength(files, filesToGet)
		end

		function testReturnsRangeOfFiles(testCase)
			filesToGet = [2 testCase.numFilesInDir];
			files = any.fileIn(testCase.testDir, filesToGet);

			testCase.verifyGreaterThanOrEqual(length(files), filesToGet(1))
			testCase.verifyLessThanOrEqual(length(files), filesToGet(2))
		end

		function testAllReturnedFilesAreUnique(testCase)
			filesToGet = randi([2 testCase.numFilesInDir]);
			files = sort(any.fileIn(testCase.testDir, filesToGet));

			testCase.verifyEqual(files, unique(files))
		end

		function testErrorIfAskedForTooManyFiles(testCase)
			filesToGet = testCase.numFilesInDir + randi(10);
			testCase.verifyError(@() any.fileIn(testCase.testDir, filesToGet), ...
								 'Any:AskedForTooManyFiles')
		end
	end

end
