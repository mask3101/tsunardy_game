module ApplicationHelper

  def eval_block(id_val, game)
    #binding.pry
    game.table_values[id_val]
  end  

end
