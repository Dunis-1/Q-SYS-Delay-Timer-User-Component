-- By Daniel Dunberg - Audiovision
--September 2025

Delay = Timer.New()
TimerValue = 1
TimerUnits = {"Sec", "Min"}
Controls.SecOrMin.Choices = TimerUnits
TimeUnit = Controls.SecOrMin

function Initialize()
  if TimeUnit.String == "" then 
    TimeUnit.String = "Sec"
  end
end

-- Set the time type between Seconds And Minutes
function SetTimeUnit()
  if TimeUnit.String == "Min" then 
    TimerValue = 60
  elseif TimeUnit.String == "Sec" then
    TimerValue = 1
  end
end

Controls.Input.EventHandler = function(ctr)
  SetTimeUnit()
    if ctr.Boolean then
      Delay:Stop()
      Controls.Output.Boolean = true
    else
      Delay:Start(Controls['Time Interval'].Value * TimerValue)
      Controls.Output.Boolean = true
    end
end

Delay.EventHandler = function() 
  Controls.Output.Boolean = false
end

Initialize()