unless ARGV.length == 1
  puts "The file needs one or more command line arguments"
  puts "Usage: ruby unix2dos.rb <FILE_NAME/FOLDER_NAME>"
  exit
end

entity_to_convert = ARGV[0]

unless File.exists?(entity_to_convert)
	puts "The specified file or directory does not exist"
	exit
end

# method to convert the line endings of a file from UNIX to DOS.
def convert_unix_2_dos(file_name)

	text = ""	
	
	puts file_name

	if !(File.directory? (file_name)) then 
		File.open(file_name,"rb") do |f|
			text = f.read.gsub("\n","\r\n")
		end

		File.open(file_name,"wb") do |f|
			f.write(text)
		end
	end
end

if File.directory? (entity_to_convert)

	# recursively convert line endings for all files inside the specific folder
	Dir.entries(entity_to_convert).each { |folder_item| convert_unix_2_dos(folder_item)	}

else 
	convert_unix_2_dos(entity_to_convert)
end

