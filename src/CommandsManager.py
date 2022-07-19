from re import search

from os.path import isdir, join, isfile
from os import chdir, makedirs, mkdir, listdir
import shutil

from csv import DictWriter
from shutil import rmtree, move

import subprocess as subproc

def getFiles(topDir, extension):
	"""This function returns the files with a specified extension that are contained in topDir.
	"""
	return [f for f in listdir(topDir) if isfile(join(topDir, f)) and f.endswith(extension)] # 

class CommandsMananger:
	def __init__(self, functionPath, scriptPath, functionName, workingDir):
		self.functionName = functionName
		self.functionPath = functionPath
		self.scriptPath = scriptPath
		self.workingDir = workingDir

	def expandCommand(self, compactCmd, directory, prjPath):
		# The expandCommand function replaces the placeholders contained in .json file with their actual values
		if '[functionPath]' in compactCmd:
			compactCmd = compactCmd.replace('[functionPath]', self.functionPath)

		if '[functionName]' in compactCmd:
			compactCmd = compactCmd.replace('[functionName]', self.functionName)

		if '[prjPath]' in compactCmd:
			compactCmd = compactCmd.replace('[prjPath]', prjPath + '/')

		if '[scriptPath]' in compactCmd:
			compactCmd = compactCmd.replace('[scriptPath]', self.scriptPath)

		if '[directoryName]' in compactCmd:
			compactCmd = compactCmd.replace('[directoryName]', directory)

		return compactCmd

	def executeCommand(self, cmd):
		outputFile = search(r'[^:\/;]\{(.*?)\}', cmd)
		flags = cmd.split(" ")

		if outputFile:
			outputFile = outputFile.group(1)
			flags.remove('{' + outputFile + '}')

			with open(outputFile, 'w') as obj:
				subproc.call(flags, stdout = obj, stderr = obj)
				# subproc.Popen(" ".join(flags), stdout=obj, stderr=obj, shell=True)
		else:
			subproc.call(flags)
			#call(flags)

	def executeCommandSet(self, cmdSet, inputsPath, parsingFunction = None, debugFlag = False):
		# Changes working directory 
		chdir(self.workingDir)
		
		# Gets the list of commands
		jsonEntry = cmdSet["dependencies"].split(" ")			
		dirs = [f for f in listdir(inputsPath) if isdir(join(inputsPath, f))]

		# Creates the directory containing the files produced during the execution
		filesDir = "files"
		resultsPath = self.workingDir + filesDir
		
		# if not isdir(resultsPath):
			# makedirs(filesDir)

		try:
		   if not isdir(resultsPath):
		       makedirs(filesDir)
		except OSError as err:
		   print(err)

		for dirName in dirs:
			filesPath = self.workingDir + '/' + filesDir + '/' + dirName
			# Creates the subdirectory containing the files produced for each input
			if not isdir(filesPath):
				makedirs(filesPath)
			chdir(filesPath)

			for entry in jsonEntry:
				cmd = cmdSet[entry]
				# Changes the values of the eventual placeholders in real ones
				completedCmd = self.expandCommand(cmd, dirName, self.workingDir)
				print(completedCmd)
				self.executeCommand(completedCmd)

			# Calls the function to parse the output	
			if parsingFunction: parsingFunction(filesPath + '/' + self.functionName, values = [dirName])
				
			# Restores the previous working directory
			chdir(self.workingDir)

			if debugFlag: rmtree(filesDir)

	def executeCommandSetBambu(self, cmdSet, resultsPath, parsingFunction = None, debugFlag = False):
		# Changes working directory 
		chdir(self.workingDir)
		
		# Gets the list of commands
		jsonEntry = cmdSet["dependencies"].split(" ")			
		dirs = [f for f in listdir(resultsPath) if isdir(join(resultsPath, f))]

		# Creates the directory containing the files produced during the execution
		filesDir = "files" # files
		makedirs(filesDir)

		for dirName in dirs:
			filesPath = self.workingDir + '/' + filesDir + '/' + dirName
			# Creates the subdirectory containing the files produced for each input
			makedirs(filesPath)
			chdir(filesPath)

			for entry in jsonEntry:
				cmd = cmdSet[entry]
				# Changes the values of the eventual placeholders in real ones
				completedCmd = self.expandCommand(cmd, dirName, self.workingDir)
				print(completedCmd)
				self.executeCommand(completedCmd)

			# Calls the function to parse the output	
			if parsingFunction: parsingFunction(filesPath + '/' + dirName, values = [dirName]) # self.functionName, values = [dirName])
				
			# Restores the previous working directory
			chdir(self.workingDir)

			if debugFlag: rmtree(filesDir)

	def movefilesBambu(self, functionName, currentType, parsingFunction = None, debugFlag = False):
		# Changes working directory 
		chdir(self.workingDir)
		resultsPathBambu = self.workingDir + '/files'  # files

		dirs = [f for f in listdir(resultsPathBambu) if isdir(join(resultsPathBambu, f))]

		for dirName in dirs:
			filesDirBambu = self.workingDir + "/results/" + currentType + '/' + 'Area_' + dirName + '.txt' # + "/filesBambu" + '/' + dirName + '.txt'
			filesPathBambu = resultsPathBambu + '/' + dirName + '/' + dirName + '.txt'
			try:
				move(filesPathBambu, filesDirBambu)
			# For other errors 
			except: 
			    print("Error occurred while copying file.") 

	def movefilesBambuNoGUI(self, functionName, currentType, resultsPath, parsingFunction = None, debugFlag = False):
		# Changes working directory 
		chdir(self.workingDir)
		resultsPathBambu = self.workingDir + '/files'  # files

		dirs = [f for f in listdir(resultsPathBambu) if isdir(join(resultsPathBambu, f))]

		for dirName in dirs:
			# filesDirBambu = self.workingDir + "/results/" + currentType + '/' + 'Area_' + dirName + '.txt' # + "/filesBambu" + '/' + dirName + '.txt'
			filesDirBambu = resultsPath + '/' + 'Area_' + dirName + '.txt' # + "/filesBambu" + '/' + dirName + '.txt'
			filesPathBambu = resultsPathBambu + '/' + dirName + '/' + dirName + '.txt'
			try:
				move(filesPathBambu, filesDirBambu)
			# For other errors 
			except: 
			    print("Error occurred while copying file.") 

	def movefilesSizeSW(self, functionName, currentType, parsingFunction = None, debugFlag = False):
		# Changes working directory 
		chdir(self.workingDir)
		resultsPathBambu = self.workingDir + '/files'

		dirs = [f for f in listdir(resultsPathBambu) if isdir(join(resultsPathBambu, f))]

		for dirName in dirs:
			filesDirBambu = self.workingDir + "/results/" + currentType + '/' + 'Size_' + dirName + '.txt' # + "/filesBambu" + '/' + dirName + '.txt'
			filesPathBambu = resultsPathBambu + '/' + dirName + '/' + dirName + '.txt'
			try:
				move(filesPathBambu, filesDirBambu)
			# For other errors 
			except: 
			    print("Error occurred while copying file.") 




