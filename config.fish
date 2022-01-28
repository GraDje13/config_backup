if status is-interactive
    # Commands to run in interactive sessions can go here
end

function view
		zathura $argv & disown (jobs -lp) & exit
end
