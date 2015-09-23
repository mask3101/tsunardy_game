module GamesHelper
  def eval_bloq(id_val, game)
    #binding.pry
    game.table_values[id_val]
  end 
end
