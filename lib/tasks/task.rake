namespace :output_task do
	desc "output  project information"
	task output_item:  :environment do
		
    Project.all.each do |project|
      puts project.title + (project.deleted? ? " (soft-deleted in db)" : "")
        project.items.each do |item|
        puts "- [" + (item.done? ? "X" : " ") + "] " + item.action + (item.deleted? ? " (soft-deleted in db)" : "")
      end
      puts ""
    end
  end
end
