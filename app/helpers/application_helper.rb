module ApplicationHelper
  
  def eval_block(i, j, game)
    case i
    when 0
     case j
     when 0
       if game.q_1_1
        return true
      else
        return false
      end
     when 1
       if game.q_1_2
        return true
      else
        return false
      end
     when 2
       if game.q_1_3
        return true
      else
        return false
      end
     when 3
       if game.q_1_4
        return true
      else
        return false
      end
     when 4
       if game.q_1_5
        return true
      else
        return false
      end
     end
    when 1
     case j
     when 0
       if game.q_2_1
        return true
      else
        return false
      end
     when 1
       if game.q_2_2
        return true
      else
        return false
      end
     when 2
       if game.q_2_3
        return true
      else
        return false
      end
     when 3
       if game.q_2_4
        return true
      else
        return false
      end
     when 4
       if game.q_2_5
        return true
      else
        return false
      end
     end
    when 2
     case j
     when 0
       if game.q_3_1
        return true
      else
        return false
      end
     when 1
       if game.q_3_2
        return true
      else
        return false
      end
     when 2
       if game.q_3_3
        return true
      else
        return false
      end
     when 3
       if game.q_3_4
        return true
      else
        return false
      end
     when 4
       if game.q_3_5
        return true
      else
        return false
      end
     end
    when 3
     case j
     when 0
       if game.q_4_1
        return true
      else
        return false
      end
     when 1
       if game.q_4_2
        return true
      else
        return false
      end
     when 2
       if game.q_4_3
        return true
      else
        return false
      end
     when 3
       if game.q_4_4
        return true
      else
        return false
      end
     when 4
       if game.q_4_5
        return true
      else
        return false
      end
     end
    when 4
     case j
     when 0
       if game.q_5_1
        return true
      else
        return false
      end
     when 1
       if game.q_5_2
        return true
      else
        return false
      end
     when 2
       if game.q_5_3
        return true
      else
        return false
      end
     when 3
       if game.q_5_4
        return true
      else
        return false
      end
     when 4
       if game.q_5_5
        return true
      else
        return false
      end
     end
    end
    
  end


  def eval_run(game)
    run_app = 0
    for i in 0..4
      for j in 0..4

    case i
    when 0
     case j
     when 0
       if !game.q_1_1
        run_app += 1
      
        
      end
     when 1
       if !game.q_1_2
        run_app += 1
      
        
      end
     when 2
       if !game.q_1_3
        run_app += 1
      
        
      end
     when 3
       if !game.q_1_4
        run_app += 1
      
        
      end
     when 4
       if !game.q_1_5
        run_app += 1
      
        
      end
     end
    when 1
     case j
     when 0
       if !game.q_2_1
        run_app += 1
      
        
      end
     when 1
       if !game.q_2_2
        run_app += 1
      
        
      end
     when 2
       if !game.q_2_3
        run_app += 1
      
        
      end
     when 3
       if !game.q_2_4
        run_app += 1
      
        
      end
     when 4
       if !game.q_2_5
        run_app += 1
      
        
      end
     end
      when 2
     case j
     when 0
       if !game.q_3_1
        run_app += 1
      
        
      end
     when 1
       if !game.q_3_2
        run_app += 1
      
        
      end
     when 2
       if !game.q_3_3
        run_app += 1
      
        
      end
     when 3
       if !game.q_3_4
        run_app += 1
      
        
      end
     when 4
       if !game.q_3_5
        run_app += 1
      
        
      end
     end
    when 3
     case j
     when 0
       if !game.q_4_1
        run_app += 1
      
        
      end
     when 1
       if !game.q_4_2
        run_app += 1
      
        
      end
     when 2
       if !game.q_4_3
        run_app += 1
      
        
      end
     when 3
       if !game.q_4_4
        run_app += 1
      
        
      end
     when 4
       if !game.q_4_5
        run_app += 1
      
        
      end
     end
    when 4
     case j
     when 0
       if !game.q_5_1
        run_app += 1
      
        
      end
     when 1
       if !game.q_5_2
        run_app += 1
      
        
      end
     when 2
       if !game.q_5_3
        run_app += 1
      
        
      end
     when 3
       if !game.q_5_4
        run_app += 1
      
        
      end
     when 4
       if !game.q_5_5
        run_app += 1
      
        
      end
     end
    end

  end
  
  end
  #binding.pry
  return run_app
  end

end
