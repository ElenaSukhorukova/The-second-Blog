=begin
  2. В приложении Ruby on Rails создайте Rake-задачу, которая бы подсчитывала количество Ruby-файлов в проекте. 
  3. В приложении Ruby on Rails создайте Rake-задачу, которая бы подсчитывала количество строк в Ruby-файлах проекта.
=end

namespace :count do
  task :count_files do  

    def check(path)
      Dir.chdir(path) do
        current_dir = Dir.new(path).children
        current_dir.reduce(0) do |counter, file|
          counter += check(File.expand_path(file)) if File.directory?(file)
          counter += File.file?(file) ? 1 : 0
        end
      end
    end
    puts check(Dir.pwd)
  end

  task :count_lines do

    def check(path)
      Dir.chdir(path) do
        current_dir = Dir.new(path).children
        current_dir.reduce(0) do |counter, file|
          counter += check(File.expand_path(file)) if File.directory?(file)
          counter += (File.extname(file) == '.rb') ? count(file) : 0
        end
      end
    end

    def count(file)
      count = 0
      File.open(file) do |item|
        item.each{|line| count += 1}
      end
      return count
    end
    puts check(Dir.pwd) 
  end
end



