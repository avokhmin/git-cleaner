namespace :git do

  desc "Removes all of the old branches that have been merged into master"
  task :remove_merged_branches do
    status = %x[ git status ]
    if status =~ /Not a git repository/
      puts status
    else
      puts "==> git checkout master"
      %x[ git checkout master ]

      puts "==> git pull"
      %x[ git pull ]

      puts "==> # Gets rid of stale tracking branches"
      puts "==> git fetch -p"
      %x[ git fetch -p ]

      puts "==> # Gets list of the all old branches that have been merged into master"
      puts "==> git branch -r --merged"
      branches = %x[ git branch -r --merged ].split(/\n/).map do |b|
        branch = b.strip
        if branch =~ /(HEAD|master|production)/
          nil
        else
          branch.split(/\//)
        end
      end.compact

      puts "==> # Will be removed '#{branches.count}' branches"
      branches.each do |branch|
        puts "==> git push #{branch[0]} :#{branch[1]}"
        # Example:
        # git push origin :branch_name
        %x[ git push #{branch[0]} :#{branch[1]} ]
      end
    end
  end # task :remove_merged_branches

end
