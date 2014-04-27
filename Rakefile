require "rake"

desc "Install dotfiles"
task :install do
  linkables = Dir.glob("*/**{.symlink}")

  skip_all      = false
  overwrite_all = false
  backup_all    = false

  linkables.each do |linkable|
    overwrite = false
    backup    = false

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        when 's' then next
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
    end
    `ln -s "$PWD/#{linkable}" "#{target}"`
  end
end

desc "Clean up installed dotfiles."
task :uninstall do
  Dir.glob('**.*/.symlink').each do |linkable|
    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    # Remove all symlinks created during installation
    if File.symlink?(target)
      FileUtils.rm(target)
    end

    # Replace any backups made during installation
    if File.exists?("#{ENV["HOME"]}/.#{file}.backup")
      `mv "$HOME/.#{file}.backup" "$HOME/.#{file}"`
    end
  end
end

desc "Builds Golang in ./goscripts to binaries in ./bin"
task :scripts do
  Dir["./goscripts/*.go"].each do |file|
    dest = "./bin/" + File.basename(file, '.go')

    src_mtime = File.mtime(file)

    dest_mtime = File.exists?(dest) ? File.mtime(dest) : Time.new(0)

    if src_mtime > dest_mtime
      puts "Compiling #{file}"
      `go build -o #{dest} #{file}`
    end
  end
end

task :default => 'install'
