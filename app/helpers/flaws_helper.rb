module FlawsHelper

	def get_priority_label(priority)
		case priority
			when "High" then "important"
			when "Medium" then "warning"
			when "Low" then "info"
			when "Info" then "inverse"
			else
			 "success"
		end
	end
	def get_mnemonic_priority(priority)
		label=nil
		priorities = { 
			"important" => "High", 
			"warning" => "Medium", 
			"info" => "Low", 
			"inverse" => "Info", 
			"success" => "Best Practice", 
		}
		case priority
			when 1
			  label="important"
			when 2
			  label="warning"
			when 3
			  label="info"
			when 4
			  label="inverse"
			else
			  label="success"
		end
		return %Q(<span class="label label-#{label}">#{priorities[label]}</span>)
	end
end
