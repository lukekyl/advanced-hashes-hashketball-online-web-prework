require "pry"


def game_hash
  stats = {:home => {}, :away => {}}
  stats[:home] = {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {
      "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1},
       "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7},
        "Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15},
        "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5},
        "Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1},
    }
    }
    
    stats[:away] = {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => {
      "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2},
       "Bismack Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists =>7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10},
        "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5},
        "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0},
        "Kemba Walker" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12},
    }
    }
  
  return stats
end


def num_points_scored(player)
  player_points = game_hash
  player_points.each{ |location, team_data|
    team_data.each{|attribute, data|
        if data.include?(player)
          return player_points[location][attribute][player][:points]
        end
    }
  }
end

def shoe_size(player)
  player_shoes = game_hash
  player_shoes.each{ |location, team_data|
    team_data.each{|attribute, data|
        if data.include?(player)
          return player_shoes[location][attribute][player][:shoe]
        end
    }
  }
end

def team_colors(team_name)
  colors = game_hash
  colors.each { |location, team_data|
    if colors[location].values.include?(team_name)
      team_data.each { |attribute, data|
        if attribute == :colors
          return data
        end
      }
    end
  }
end

def team_names
  name = game_hash
  names = []
  name.each { |location, team_data|
    team_data.each {|attribute, data|
      if attribute == :team_name
        names << data
      end
    }
  }
  return names
end

def player_numbers(team_name)
  player = game_hash
  numbers = []
  player.each { |location, attributes|
    if player[location].values.include?(team_name)
      attributes.each { |attribute, info|
        if info.class == Hash
          info.each { |player, stats|
            stats.each { |data, int|
              if data == :number
                numbers << int.to_i
              end
            }
          }
        end
      }
    end
  }
  return numbers
end

def player_stats(player)
  stats = game_hash
  stats.each{ |location, team_data|
    team_data.each{|attribute, data|
        if data.include?(player)
          return stats[location][attribute][player]
        end
    }
  }
end

def big_shoe_rebounds
  rebounds = game_hash
  shoe = 0
  rebound = 0
  rebounds.each {|location, team_data|
    team_data.each {|attribute, info|
      if info.class == Hash
        info.each {|player, stats|
          stats.each {|data, int|
            if data == :shoe && int > shoe
              
              rebound = rebounds[location][attribute][player][:rebounds]
              shoe = int
              
            end
          }
        }
      end
    }
  }
  return rebound
end

def most_points_scored
  points = game_hash
  name = ""
  total = 0
  points.each {|location, team_data|
    team_data.each {|attribute, info|
      if info.class == Hash
        info.each {|player, stats|
          stats.each {|data, int|
            if data == :points && int > total
              
              name = points[location][attribute]
              total = int
              
            end
          }
        }
      end
    }
  }
  return name
end
