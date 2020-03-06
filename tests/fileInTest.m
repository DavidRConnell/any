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
			testCase.verifyEqual(length(files), filesToGet)
		end

		function testErrorIfAskedForTooManyFiles(testCase)
			filesToGet = testCase.numFilesInDir + randi(10);

			try
				files = any.fileIn(testCase.testDir, filesToGet);
				testCase.verifyFalse(true);
			catch ME
				testCase.verifyEqual(ME.identifier, 'Any:AskedForTooManyFiles')
			end
		end
	end

end
