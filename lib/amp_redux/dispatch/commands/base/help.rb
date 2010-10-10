Amp::Command.namespace "base" do
  Amp::Command.create('help') do |c|
    c.desc 'Shows this help'
    c.on_call do |opts, args|
      Amp::Command::Base.all_commands.each do |command|
        puts "#{command.name.downcase} - #{command.desc}"
      end
    end
  end
end