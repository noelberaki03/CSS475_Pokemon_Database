-- phpMyAdmin SQL Dump
-- version 4.2.4
-- http://www.phpmyadmin.net
--
-- Host: noel30.vergil.u.washington.edu:3475
-- Generation Time: May 29, 2024 at 02:40 PM
-- Server version: 5.5.18
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pokemon`
--
CREATE DATABASE IF NOT EXISTS `pokemon` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pokemon`;

-- --------------------------------------------------------
--
-- Table structure for table `Trainer`
--
DROP TABLE IF EXISTS Trainer;
CREATE TABLE IF NOT EXISTS Trainer (
  trainer_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(40) UNIQUE NOT NULL
);

--
-- Dumping data for table `Trainer`
--
INSERT INTO Trainer (name) VALUES 
('Ash'), ('Misty'), ('Brock'), 
('Gary'), ('Erika'), ('Koga'), 
('Sabrina'), ('Blaine'), ('Giovanni'), 
('Lorelei'), ('Bruno'), ('Agatha'), 
('Lance'), ('Tracey'), ('Cynthia');

-- --------------------------------------------------------
--
-- Table structure for table `Archetype`
--
DROP TABLE IF EXISTS Archetype;
CREATE TABLE IF NOT EXISTS Archetype (
  archetype_id INTEGER PRIMARY KEY AUTOINCREMENT,
  archetype_name VARCHAR(50) UNIQUE NOT NULL,
  archetype_description VARCHAR(300) NOT NULL
);

--
-- Dumping data for table `Archetype`
--
INSERT INTO Archetype (archetype_name, archetype_description) VALUES 
('Ace Trainer', 'Highly skilled and experienced in battles.'),
('Bug Catcher', 'Specializes in catching and training Bug-type Pokémon.'),
('Cooltrainer', 'Elite trainers with strong and diverse Pokémon teams.'),
('Dragon Tamer', 'Masters of Dragon-type Pokémon.'),
('Gym Leader', 'Leaders of Pokémon Gyms and strong trainers.'),
('Pokémon Breeder', 'Specializes in breeding Pokémon for various traits.'),
('Pokémon Professor', 'Researchers who study various aspects of Pokémon.'),
('Rival', 'Competitive trainers who challenge the player.'),
('Team Rocket Member', 'Members of the criminal organization Team Rocket.');

-- --------------------------------------------------------
--
-- Table structure for table `Trainer_Archetype`
--
DROP TABLE IF EXISTS Trainer_Archetype;
CREATE TABLE IF NOT EXISTS Trainer_Archetype (
  trainer_id INTEGER,
  archetype_id INTEGER,
  PRIMARY KEY (trainer_id, archetype_id),
  FOREIGN KEY (trainer_id) REFERENCES Trainer (trainer_id),
  FOREIGN KEY (archetype_id) REFERENCES Archetype (archetype_id)
);

--
-- Dumping data for table `Trainer_Archetype`
--
INSERT INTO Trainer_Archetype (trainer_id, archetype_id) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), 
(6, 5), (7, 5), (8, 5), (9, 5), (10, 6), 
(11, 6), (12, 6), (13, 6), (14, 7), (15, 8);

-- --------------------------------------------------------
--
-- Table structure for table `Badges`
--
DROP TABLE IF EXISTS Badges;
CREATE TABLE IF NOT EXISTS Badge (
  badge_id INTEGER PRIMARY KEY AUTOINCREMENT,
  badge_name VARCHAR(50) UNIQUE
);

--
-- Dumping data for table `Badges`
--
INSERT INTO Badge (badge_name) VALUES 
('Boulder Badge'), 
('Cascade Badge'), 
('Thunder Badge'), 
('Rainbow Badge'), 
('Soul Badge'), 
('Marsh Badge'), 
('Volcano Badge'), 
('Earth Badge');

-- --------------------------------------------------------
--
-- Table structure for table `Trainer_Badges`
--
DROP TABLE IF EXISTS Trainer_Badges;
CREATE TABLE IF NOT EXISTS Trainer_Badges (
  trainer_id INTEGER,
  badge_id INTEGER,
  date_badge_acquired DATE,
  FOREIGN KEY (trainer_id) REFERENCES Trainer (trainer_id),
  FOREIGN KEY (badge_id) REFERENCES Badge (badge_id),
  PRIMARY KEY (trainer_id, badge_id) 
);

--
-- Dumping data for table `Trainer_Badges`
--
INSERT INTO Trainer_Badges (trainer_id, badge_id, date_badge_acquired) VALUES 
(1, 1, '2024-01-01'), (1, 2, '2024-01-02'), (1, 3, '2024-01-03'), (1, 4, '2024-01-04'), (1, 5, '2024-01-05'), (1, 6, '2024-01-06'), (1, 7, '2024-01-07'), (1, 8, '2024-01-08'),
(2, 1, '2024-01-09'), (2, 2, '2024-01-10'), (2, 3, '2024-01-11'), (2, 4, '2024-01-12'), (2, 5, '2024-01-13'), (2, 6, '2024-01-14'), (2, 7, '2024-01-15'), (2, 8, '2024-01-16'),
(3, 1, '2024-01-17'), (3, 2, '2024-01-18'), (3, 3, '2024-01-19'), (3, 4, '2024-01-20'), (3, 5, '2024-01-21'), (3, 6, '2024-01-22'), (3, 7, '2024-01-23'), (3, 8, '2024-01-24'),
(4, 1, '2024-01-25'), (4, 2, '2024-01-26'), (4, 3, '2024-01-27'),
(5, 1, '2024-01-28'), (5, 2, '2024-01-29'), (5, 3, '2024-01-30'), (5, 4, '2024-01-31'), (5, 5, '2024-02-01'),
(6, 1, '2024-02-02'), (6, 2, '2024-02-03'), (6, 3, '2024-02-04'), (6, 4, '2024-02-05'), (6, 5, '2024-02-06'), (6, 6, '2024-02-07'),
(7, 1, '2024-02-08'), (7, 2, '2024-02-09'), (7, 3, '2024-02-10'),
(8, 1, '2024-02-11'), (8, 2, '2024-02-12'), (8, 3, '2024-02-13'), (8, 4, '2024-02-14'),
(9, 1, '2024-02-15'), (9, 2, '2024-02-16'), (9, 3, '2024-02-17'),
(10, 1, '2024-02-18'), (10, 2, '2024-02-19'), (10, 3, '2024-02-20'), (10, 4, '2024-02-21'), (10, 5, '2024-02-22'), (10, 6, '2024-02-23'),
(11, 1, '2024-02-24'), (11, 2, '2024-02-25'), (11, 3, '2024-02-26'),
(12, 1, '2024-02-27'), (12, 2, '2024-02-28'), (12, 3, '2024-02-29'), (12, 4, '2024-03-01'),
(13, 1, '2024-03-02'), (13, 2, '2024-03-03'), (13, 3, '2024-03-04'), (13, 4, '2024-03-05'), (13, 5, '2024-03-06'),
(14, 1, '2024-03-07'), (14, 2, '2024-03-08'), (14, 3, '2024-03-09'),
(15, 1, '2024-03-10'), (15, 2, '2024-03-11'), (15, 3, '2024-03-12'), (15, 4, '2024-03-13'), (15, 5, '2024-03-14'), (15, 6, '2024-03-15');

-- --------------------------------------------------------
--
-- Table structure for table `Item`
--
DROP TABLE IF EXISTS Item;
CREATE TABLE IF NOT EXISTS Item (
  item_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(40) DEFAULT 'Unknown',
  cost INTEGER,
  effect INTEGER,
  item_description VARCHAR(300) NOT NULL
);

--
-- Dumping data for table `Item`
--
INSERT INTO Item (name, cost, effect, item_description) VALUES 
('Poké Ball', 200, 1, 'A device for catching wild Pokémon.'),
('Great Ball', 600, 1, 'A high-performance Ball with a higher catch rate.'),
('Ultra Ball', 1200, 1, 'An ultra-high-performance Ball with a higher catch rate.'),
('Potion', 300, 20, 'Restores the HP of one Pokémon by 20 points.'),
('Super Potion', 700, 50, 'Restores the HP of one Pokémon by 50 points.'),
('Hyper Potion', 1500, 200, 'Restores the HP of one Pokémon by 200 points.'),
('Revive', 2000, 50, 'Revives a fainted Pokémon with half its max HP.'),
('Max Revive', 4000, 100, 'Revives a fainted Pokémon with all its HP.'),
('Full Heal', 600, 0, 'Cures all the status problems of one Pokémon.'),
('Escape Rope', 550, 0, 'A long, durable rope used to escape from caves or dungeons.'),
('Repel', 350, 0, 'Repels weak wild Pokémon for 100 steps.'),
('Super Repel', 500, 0, 'Repels weak wild Pokémon for 200 steps.'),
('Max Repel', 700, 0, 'Repels weak wild Pokémon for 250 steps.'),
('Rare Candy', 4800, 1, 'Raises the level of a Pokémon by one.'),
('Exp. Share', 3000, 1, 'A hold item that shares experience points.'),
('Bicycle', 1000000, 0, 'A folding bicycle that enables a faster movement.'),
('Old Rod', 500, 0, 'An old and beat-up fishing rod.'),
('Good Rod', 1500, 0, 'A decent fishing rod for catching Pokémon.'),
('Super Rod', 3000, 0, 'The best fishing rod for catching Pokémon.'),
('Fire Stone', 2100, 1, 'A stone that evolves certain Fire-type Pokémon.'),
('Water Stone', 2100, 1, 'A stone that evolves certain Water-type Pokémon.'),
('Thunder Stone', 2100, 1, 'A stone that evolves certain Electric-type Pokémon.'),
('Leaf Stone', 2100, 1, 'A stone that evolves certain Grass-type Pokémon.'),
('Moon Stone', 2100, 1, 'A stone that evolves certain Pokémon.'),
('Sun Stone', 2100, 1, 'A stone that evolves certain Pokémon.'),
('King’s Rock', 2000, 1, 'A rock that evolves certain Pokémon.'),
('Metal Coat', 2000, 1, 'An item that evolves certain Pokémon.'),
('Dragon Scale', 2000, 1, 'An item that evolves certain Pokémon.'),
('Up-Grade', 2000, 1, 'An item that evolves Porygon.'),
('Deep Sea Tooth', 2000, 1, 'A shard that evolves Clamperl into Huntail.'),
('Deep Sea Scale', 2000, 1, 'A shard that evolves Clamperl into Gorebyss.'),
('Ultra Ball', 1200, 1, 'An ultra-high-performance Ball with a higher catch rate.'),
('Master Ball', 0, 1, 'The best Ball with the ultimate level of performance. It will catch any wild Pokémon without fail.'),
('Great Ball', 600, 1, 'A good, high-performance Ball that provides a higher Pokémon catch rate than a standard Poké Ball.'),
('Potion', 300, 20, 'A spray-type medicine for treating wounds. It can be used to restore 20 HP to a single Pokémon.'),
('Super Potion', 700, 50, 'A spray-type medicine for treating wounds. It can be used to restore 50 HP to a single Pokémon.'),
('Hyper Potion', 1500, 200, 'A spray-type medicine for treating wounds. It can be used to restore 200 HP to a single Pokémon.'),
('Max Potion', 2500, 9999, 'A spray-type medicine for treating wounds. It will completely restore the max HP of a single Pokémon.'),
('Full Restore', 3000, 9999, 'A medicine that can be used to fully restore the HP of a single Pokémon and heal any status conditions it has.'),
('Revive', 2000, 50, 'A medicine that can be used to revive a single Pokémon that has fainted.'),
('Max Revive', 4000, 9999, 'A medicine that can be used to revive a single Pokémon that has fainted. It also fully restores the Pokémon’s max HP.'),
('Escape Rope', 550, 0, 'A long and durable rope. Use it to escape instantly from a cave or a dungeon.'),
('Repel', 350, 0, 'An item that prevents any low-level wild Pokémon from jumping out at you for 100 steps after its use.'),
('Super Repel', 500, 0, 'An item that prevents any low-level wild Pokémon from jumping out at you for 200 steps after its use.'),
('Max Repel', 700, 0, 'An item that prevents any low-level wild Pokémon from jumping out at you for 250 steps after its use.'),
('Rare Candy', 4800, 1, 'A candy that is packed with energy. When consumed, it will instantly raise the level of a single Pokémon by one.'),
('Exp. Share', 3000, 0, 'A mysterious device that allows all the Pokémon in your party to gain experience points.'),
('Bicycle', 1000000, 0, 'A folding bicycle that enables a rider to get around much faster than with Running Shoes.'),
('Old Rod', 500, 0, 'An old and beat-up fishing rod. Use it at any body of water to fish for wild Pokémon.'),
('Good Rod', 1500, 0, 'A new, good-quality fishing rod. Use it at any body of water to fish for wild Pokémon.'),
('Super Rod', 3000, 0, 'An awesome, high-tech fishing rod. Use it at any body of water to fish for wild Pokémon.'),
('Fire Stone', 2100, 1, 'A peculiar stone that can make certain species of Pokémon evolve. The stone has a fiery orange heart.'),
('Water Stone', 2100, 1, 'A peculiar stone that can make certain species of Pokémon evolve. It is the blue of a pool of clear water.'),
('Thunder Stone', 2100, 1, 'A peculiar stone that can make certain species of Pokémon evolve. It has a distinct thunderbolt pattern.'),
('Leaf Stone', 2100, 1, 'A peculiar stone that can make certain species of Pokémon evolve. It has an unmistakable leaf pattern.'),
('Moon Stone', 2100, 1, 'A peculiar stone that can make certain species of Pokémon evolve. It is as black as the night sky.'),
('Sun Stone', 2100, 1, 'A peculiar stone that can make certain species of Pokémon evolve. It burns as red as the evening sun.'),
('King’s Rock', 2000, 1, 'A rock that can make certain species of Pokémon evolve. It looks like a crown.'),
('Metal Coat', 2000, 1, 'A coating that can make certain species of Pokémon evolve. It is a special metallic film.'),
('Dragon Scale', 2000, 1, 'A scale that can make certain species of Pokémon evolve. It is a very tough and inflexible scale.'),
('Up-Grade', 2000, 1, 'A transparent device that can make certain species of Pokémon evolve. It was produced by Silph Co.'),
('Deep Sea Tooth', 2000, 1, 'A shard that can make certain species of Pokémon evolve. It is made of sharp fangs that once belonged to a deep-sea Pokémon.'),
('Deep Sea Scale', 2000, 1, 'A shard that can make certain species of Pokémon evolve. It is made of smooth scales that once belonged to a deep-sea Pokémon.'),
('Light Ball', 2000, 0, 'An item to be held by Pikachu. It is a puzzling orb that raises the Attack and Sp. Atk stats of Pikachu.'),
('Soothe Bell', 2000, 0, 'An item to be held by a Pokémon. The comforting chime of this bell calms the holder, making it friendly.'),
('Everstone', 2000, 0, 'An item to be held by a Pokémon. A Pokémon holding this peculiar stone is prevented from evolving.'),
('Focus Sash', 2000, 0, 'An item to be held by a Pokémon. If the holder has full HP, it will endure a potential KO attack with 1 HP.'),
('Life Orb', 2000, 0, 'An item to be held by a Pokémon. It boosts the power of moves but costs some HP on each hit.'),
('Choice Band', 2000, 0, 'An item to be held by a Pokémon. This curious headband boosts Attack but only allows the use of one move.'),
('Choice Scarf', 2000, 0, 'An item to be held by a Pokémon. This curious scarf boosts Speed but only allows the use of one move.'),
('Choice Specs', 2000, 0, 'An item to be held by a Pokémon. These curious glasses boost Sp. Atk but only allow the use of one move.'),
('Assault Vest', 2000, 0, 'An item to be held by a Pokémon. This offensive vest raises Sp. Def but prevents the use of status moves.'),
('Rocky Helmet', 2000, 0, 'An item to be held by a Pokémon. If the holder is hit, the attacker will also be damaged upon contact.'),
('Leftovers', 2000, 0, 'An item to be held by a Pokémon. The holder’s HP is slowly but steadily restored throughout every battle.'),
('Black Sludge', 2000, 0, 'An item to be held by a Pokémon. It gradually restores HP to Poison-type Pokémon.'),
('Shell Bell', 2000, 0, 'An item to be held by a Pokémon. The holder restores a little HP every time it inflicts damage.'),
('Scope Lens', 2000, 0, 'An item to be held by a Pokémon. It is a lens that boosts the holder’s critical-hit ratio.'),
('Wide Lens', 2000, 0, 'An item to be held by a Pokémon. It is a magnifying lens that boosts the accuracy of moves.'),
('Zoom Lens', 2000, 0, 'An item to be held by a Pokémon. If the holder moves after the target, its accuracy will be boosted.'),
('Expert Belt', 2000, 0, 'An item to be held by a Pokémon. It is a well-worn belt that boosts the power of super-effective moves.'),
('Heat Rock', 2000, 0, 'An item to be held by a Pokémon. It extends the duration of the move Sunny Day when used by the holder.'),
('Damp Rock', 2000, 0, 'An item to be held by a Pokémon. It extends the duration of the move Rain Dance when used by the holder.');

-- --------------------------------------------------------
--
-- Table structure for table `Trainer_Item`
--
DROP TABLE IF EXISTS Trainer_Item;
CREATE TABLE IF NOT EXISTS Trainer_Item (
  trainer_id INTEGER,
  item_id INTEGER,
  FOREIGN KEY (trainer_id) REFERENCES Trainer (trainer_id),
  FOREIGN KEY (item_id) REFERENCES Item (item_id),
  PRIMARY KEY (trainer_id, item_id)
);

--
-- Dumping data for table `Item`
--
INSERT INTO Trainer_Item (trainer_id, item_id) VALUES 
(1, 1), (1, 2), (1, 3), (1, 4), 
(2, 1), (2, 5), (2, 6), (2, 7), 
(3, 1), (3, 8), (3, 9), (3, 10), 
(4, 1), (4, 11), (4, 12), (4, 13), 
(5, 1), (5, 14), (5, 15), (5, 16), 
(6, 1), (6, 17), (6, 18), (6, 19), 
(7, 1), (7, 20), (7, 21), (7, 22), 
(8, 1), (8, 23), (8, 24), (8, 25), 
(9, 1), (9, 26), (9, 27), (9, 28), 
(10, 1), (10, 29), (10, 30), (10, 31), 
(11, 1), (11, 32), (11, 33), (11, 34), 
(12, 1), (12, 35), (12, 36), (12, 37), 
(13, 1), (13, 38), (13, 39), (13, 40), 
(14, 1), (14, 41), (14, 42), (14, 43), 
(15, 1), (15, 44), (15, 45), (15, 46);

-- --------------------------------------------------------
--
-- Table structure for table `Pokemon`
--
DROP TABLE IF EXISTS Pokemon;
CREATE TABLE IF NOT EXISTS Pokemon (
  u_id INTEGER PRIMARY KEY AUTOINCREMENT,
  national_pokedex_id INTEGER NOT NULL,
  name VARCHAR(40) DEFAULT 'Unknown',
  ability VARCHAR(40),
  level INTEGER DEFAULT 0,
  health_points INTEGER DEFAULT 0,
  attack INTEGER DEFAULT 0 CHECK (attack <= 250 AND attack >= 0),
  defense INTEGER DEFAULT 0 CHECK (defense <= 250 AND defense >= 0),
  special_attack INTEGER DEFAULT 0 CHECK (special_attack <= 250 AND special_attack >= 0),
  special_defense INTEGER DEFAULT 0 CHECK (special_defense <= 250 AND special_defense >= 0),
  speed INTEGER DEFAULT 0 CHECK (speed <= 250 AND speed >= 0)
);

--
-- Dumping data for table `Pokemon`
--
INSERT INTO Pokemon (national_pokedex_id, name, ability, level, health_points, attack, defense, special_attack, special_defense, speed) VALUES 
(1, 'Bulbasaur', 'Overgrow', 5, 45, 49, 49, 65, 65, 45),
(1, 'Bulbasaur', 'Overgrow', 10, 45, 50, 50, 65, 65, 46),
(2, 'Ivysaur', 'Overgrow', 16, 60, 62, 63, 80, 80, 60),
(3, 'Venusaur', 'Overgrow', 32, 80, 82, 83, 100, 100, 80),
(4, 'Charmander', 'Blaze', 5, 39, 52, 43, 60, 50, 65),
(4, 'Charmander', 'Blaze', 10, 40, 53, 44, 61, 51, 66),
(5, 'Charmeleon', 'Blaze', 16, 58, 64, 58, 80, 65, 80),
(6, 'Charizard', 'Blaze', 36, 78, 84, 78, 109, 85, 100),
(6, 'Charizard', 'Blaze', 50, 80, 85, 80, 110, 90, 105),
(7, 'Squirtle', 'Torrent', 5, 44, 48, 65, 50, 64, 43),
(7, 'Squirtle', 'Torrent', 10, 45, 49, 66, 51, 65, 44),
(8, 'Wartortle', 'Torrent', 16, 59, 63, 80, 65, 80, 58),
(9, 'Blastoise', 'Torrent', 36, 79, 83, 100, 85, 105, 78),
(9, 'Blastoise', 'Torrent', 50, 80, 84, 101, 86, 106, 79),
(10, 'Caterpie', 'Shield Dust', 5, 45, 30, 35, 20, 20, 45),
(10, 'Caterpie', 'Shield Dust', 7, 46, 31, 36, 21, 21, 46),
(11, 'Metapod', 'Shed Skin', 7, 50, 20, 55, 25, 25, 30),
(12, 'Butterfree', 'Compound Eyes', 10, 60, 45, 50, 90, 80, 70),
(12, 'Butterfree', 'Compound Eyes', 15, 62, 47, 52, 92, 82, 72),
(13, 'Weedle', 'Shield Dust', 5, 40, 35, 30, 20, 20, 50),
(14, 'Kakuna', 'Shed Skin', 7, 45, 25, 50, 25, 25, 35),
(15, 'Beedrill', 'Swarm', 10, 65, 90, 40, 45, 80, 75),
(15, 'Beedrill', 'Swarm', 20, 70, 95, 45, 50, 85, 80),
(16, 'Pidgey', 'Keen Eye', 5, 40, 45, 40, 35, 35, 56),
(16, 'Pidgey', 'Keen Eye', 10, 42, 47, 42, 37, 37, 58),
(17, 'Pidgeotto', 'Keen Eye', 18, 63, 60, 55, 50, 50, 71),
(18, 'Pidgeot', 'Keen Eye', 36, 83, 80, 75, 70, 70, 91),
(19, 'Rattata', 'Run Away', 5, 30, 56, 35, 25, 35, 72),
(20, 'Raticate', 'Run Away', 20, 55, 81, 60, 50, 70, 97),
(21, 'Spearow', 'Keen Eye', 5, 40, 60, 30, 31, 31, 70),
(22, 'Fearow', 'Keen Eye', 20, 65, 90, 65, 61, 61, 100),
(23, 'Ekans', 'Intimidate', 5, 35, 60, 44, 40, 54, 55),
(24, 'Arbok', 'Intimidate', 22, 60, 85, 69, 65, 79, 80),
(25, 'Pikachu', 'Static', 5, 35, 55, 40, 50, 50, 90),
(26, 'Raichu', 'Static', 22, 60, 90, 55, 90, 80, 110),
(27, 'Sandshrew', 'Sand Veil', 5, 50, 75, 85, 20, 30, 40),
(27, 'Sandshrew', 'Sand Veil', 10, 52, 77, 87, 22, 32, 42),
(28, 'Sandslash', 'Sand Veil', 22, 75, 100, 110, 45, 55, 65),
(29, 'Nidoran♀', 'Poison Point', 5, 55, 47, 52, 40, 40, 41),
(30, 'Nidorina', 'Poison Point', 16, 70, 62, 67, 55, 55, 56),
(31, 'Nidoqueen', 'Poison Point', 36, 90, 82, 87, 75, 85, 76),
(32, 'Scyther', 'Swarm', 5, 70, 110, 80, 55, 80, 105),
(32, 'Scyther', 'Swarm', 10, 75, 115, 85, 60, 85, 110),
(32, 'Scyther', 'Swarm', 15, 80, 120, 90, 65, 90, 115),
(33, 'Jigglypuff', 'Cute Charm', 5, 115, 45, 20, 45, 25, 20),
(33, 'Jigglypuff', 'Cute Charm', 10, 120, 50, 25, 50, 30, 25),
(34, 'Wigglytuff', 'Cute Charm', 20, 140, 70, 45, 85, 50, 45),
(35, 'Zubat', 'Inner Focus', 5, 40, 45, 35, 30, 40, 55),
(36, 'Golbat', 'Inner Focus', 22, 75, 80, 70, 65, 75, 90),
(37, 'Oddish', 'Chlorophyll', 5, 45, 50, 55, 75, 65, 30),
(37, 'Oddish', 'Chlorophyll', 10, 50, 55, 60, 80, 70, 35),
(38, 'Gloom', 'Chlorophyll', 21, 60, 65, 70, 85, 75, 40),
(39, 'Vileplume', 'Chlorophyll', 36, 75, 80, 85, 110, 90, 50),
(40, 'Paras', 'Effect Spore', 5, 35, 70, 55, 45, 55, 25),
(41, 'Parasect', 'Effect Spore', 24, 60, 95, 80, 60, 80, 30),
(42, 'Venonat', 'Compound Eyes', 5, 60, 55, 50, 40, 55, 45),
(43, 'Venomoth', 'Shield Dust', 31, 70, 65, 60, 90, 75, 90),
(44, 'Diglett', 'Sand Veil', 5, 10, 55, 25, 35, 45, 95),
(45, 'Dugtrio', 'Sand Veil', 26, 35, 80, 50, 50, 70, 120),
(46, 'Meowth', 'Pickup', 5, 40, 45, 35, 40, 40, 90),
(47, 'Persian', 'Limber', 28, 65, 70, 60, 65, 65, 115),
(48, 'Psyduck', 'Damp', 5, 50, 52, 48, 65, 50, 55),
(49, 'Golduck', 'Damp', 33, 80, 82, 78, 95, 80, 85),
(50, 'Mankey', 'Vital Spirit', 5, 40, 80, 35, 35, 45, 70),
(51, 'Primeape', 'Vital Spirit', 28, 65, 105, 60, 60, 70, 95),
(52, 'Growlithe', 'Intimidate', 5, 55, 70, 45, 70, 50, 60),
(53, 'Arcanine', 'Intimidate', 34, 90, 110, 80, 100, 80, 95),
(54, 'Poliwag', 'Water Absorb', 5, 40, 50, 40, 40, 40, 90),
(55, 'Poliwhirl', 'Water Absorb', 25, 65, 65, 65, 50, 50, 90),
(56, 'Poliwrath', 'Water Absorb', 36, 90, 85, 95, 70, 90, 70),
(57, 'Abra', 'Synchronize', 5, 25, 20, 15, 105, 55, 90),
(58, 'Kadabra', 'Synchronize', 16, 40, 35, 30, 120, 70, 105),
(59, 'Alakazam', 'Synchronize', 36, 55, 50, 45, 135, 95, 120),
(60, 'Machop', 'Guts', 5, 70, 80, 50, 35, 35, 35),
(61, 'Machoke', 'Guts', 28, 80, 100, 70, 50, 60, 45),
(62, 'Machamp', 'Guts', 36, 90, 130, 80, 65, 85, 55),
(1, 'Bulbasaur', 'Overgrow', 12, 45, 50, 55, 65, 70, 46),
(3, 'Venusaur', 'Overgrow', 45, 85, 90, 85, 110, 95, 80),
(6, 'Charizard', 'Blaze', 50, 90, 90, 85, 115, 85, 105),
(9, 'Blastoise', 'Torrent', 50, 95, 100, 95, 105, 100, 85),
(12, 'Butterfree', 'Compound Eyes', 22, 70, 50, 55, 95, 85, 75),
(15, 'Beedrill', 'Swarm', 25, 70, 95, 50, 55, 85, 90),
(18, 'Pidgeot', 'Keen Eye', 40, 90, 85, 80, 75, 75, 100),
(20, 'Raticate', 'Run Away', 32, 60, 85, 65, 55, 75, 100),
(22, 'Fearow', 'Keen Eye', 35, 70, 95, 70, 65, 65, 110),
(24, 'Arbok', 'Intimidate', 35, 70, 90, 75, 70, 80, 90),
(26, 'Raichu', 'Static', 28, 65, 95, 60, 95, 85, 115),
(28, 'Sandslash', 'Sand Veil', 25, 80, 105, 90, 55, 65, 70),
(31, 'Nidoqueen', 'Poison Point', 36, 95, 85, 90, 85, 90, 76),
(33, 'Nidorino', 'Poison Point', 16, 60, 72, 57, 55, 55, 65),
(34, 'Nidoking', 'Poison Point', 36, 81, 92, 77, 85, 75, 85),
(38, 'Ninetales', 'Flash Fire', 30, 73, 76, 75, 81, 100, 100),
(40, 'Wigglytuff', 'Cute Charm', 34, 140, 70, 45, 85, 50, 45),
(42, 'Golbat', 'Inner Focus', 22, 75, 80, 70, 65, 75, 90),
(45, 'Vileplume', 'Chlorophyll', 36, 75, 80, 85, 110, 90, 50),
(47, 'Parasect', 'Effect Spore', 24, 60, 95, 80, 60, 80, 30),
(49, 'Venomoth', 'Shield Dust', 31, 70, 65, 60, 90, 75, 90),
(51, 'Dugtrio', 'Sand Veil', 26, 35, 80, 50, 50, 70, 120),
(53, 'Persian', 'Limber', 28, 65, 70, 60, 65, 65, 115),
(55, 'Golduck', 'Damp', 33, 80, 82, 78, 95, 80, 85),
(57, 'Primeape', 'Vital Spirit', 28, 65, 105, 60, 60, 70, 95),
(59, 'Arcanine', 'Intimidate', 34, 90, 110, 80, 100, 80, 95),
(62, 'Poliwrath', 'Water Absorb', 36, 90, 85, 95, 70, 90, 70),
(65, 'Alakazam', 'Synchronize', 36, 55, 50, 45, 135, 95, 120),
(68, 'Machamp', 'Guts', 36, 90, 130, 80, 65, 85, 55),
(71, 'Victreebel', 'Chlorophyll', 36, 80, 105, 65, 100, 60, 70),
(73, 'Tentacruel', 'Clear Body', 30, 80, 70, 65, 80, 120, 100),
(76, 'Golem', 'Rock Head', 36, 80, 110, 130, 55, 65, 45),
(78, 'Rapidash', 'Run Away', 40, 65, 100, 70, 80, 80, 105),
(80, 'Slowbro', 'Oblivious', 28, 95, 75, 110, 100, 80, 30),
(83, 'Farfetch’d', 'Keen Eye', 5, 52, 65, 55, 58, 62, 60),
(85, 'Dodrio', 'Run Away', 31, 60, 110, 70, 60, 60, 110),
(87, 'Dewgong', 'Thick Fat', 34, 90, 70, 80, 70, 95, 70),
(89, 'Muk', 'Stench', 25, 105, 105, 75, 65, 100, 50),
(91, 'Cloyster', 'Shell Armor', 36, 50, 95, 180, 85, 45, 70),
(94, 'Gengar', 'Cursed Body', 36, 60, 65, 60, 130, 75, 110),
(95, 'Onix', 'Rock Head', 20, 35, 45, 160, 30, 45, 70),
(96, 'Drowzee', 'Insomnia', 5, 60, 48, 45, 43, 90, 42),
(97, 'Hypno', 'Insomnia', 26, 85, 73, 70, 73, 115, 67),
(98, 'Krabby', 'Hyper Cutter', 5, 30, 105, 90, 25, 25, 50),
(99, 'Kingler', 'Hyper Cutter', 28, 55, 130, 115, 50, 50, 75),
(100, 'Voltorb', 'Soundproof', 5, 40, 30, 50, 55, 55, 100),
(101, 'Electrode', 'Soundproof', 28, 60, 50, 70, 80, 80, 140),
(102, 'Exeggcute', 'Chlorophyll', 5, 60, 40, 80, 60, 45, 40),
(103, 'Exeggutor', 'Chlorophyll', 28, 95, 95, 85, 125, 65, 55),
(104, 'Cubone', 'Rock Head', 5, 50, 50, 95, 40, 50, 35),
(105, 'Marowak', 'Rock Head', 28, 60, 80, 110, 50, 80, 45),
(106, 'Hitmonlee', 'Limber', 30, 50, 120, 53, 35, 110, 87),
(107, 'Hitmonchan', 'Iron Fist', 30, 50, 105, 79, 35, 110, 76),
(108, 'Lickitung', 'Own Tempo', 5, 90, 55, 75, 60, 75, 30),
(109, 'Koffing', 'Levitate', 5, 40, 65, 95, 60, 45, 35),
(110, 'Weezing', 'Levitate', 28, 65, 90, 120, 85, 70, 60),
(111, 'Rhyhorn', 'Lightning Rod', 5, 80, 85, 95, 30, 30, 25),
(112, 'Rhydon', 'Lightning Rod', 28, 105, 130, 120, 45, 45, 40),
(113, 'Chansey', 'Natural Cure', 5, 250, 5, 5, 35, 105, 50),
(114, 'Tangela', 'Chlorophyll', 5, 65, 55, 115, 100, 40, 60),
(115, 'Kangaskhan', 'Early Bird', 5, 105, 95, 80, 40, 80, 90),
(116, 'Horsea', 'Swift Swim', 5, 30, 40, 70, 70, 25, 60),
(117, 'Seadra', 'Poison Point', 28, 55, 65, 95, 95, 45, 85),
(118, 'Goldeen', 'Swift Swim', 5, 45, 67, 60, 35, 50, 63),
(119, 'Seaking', 'Swift Swim', 28, 80, 92, 65, 65, 80, 68),
(120, 'Staryu', 'Illuminate', 5, 30, 45, 55, 70, 55, 85),
(121, 'Starmie', 'Illuminate', 28, 60, 75, 85, 100, 85, 115),
(122, 'Mr. Mime', 'Soundproof', 5, 40, 45, 65, 100, 120, 90),
(123, 'Scyther', 'Swarm', 5, 70, 110, 80, 55, 80, 105),
(124, 'Jynx', 'Oblivious', 5, 65, 50, 35, 115, 95, 95),
(125, 'Electabuzz', 'Static', 5, 65, 83, 57, 95, 85, 105),
(126, 'Magmar', 'Flame Body', 5, 65, 95, 57, 100, 85, 93),
(127, 'Pinsir', 'Hyper Cutter', 5, 65, 125, 100, 55, 70, 85),
(128, 'Tauros', 'Intimidate', 5, 75, 100, 95, 40, 70, 110),
(129, 'Magikarp', 'Swift Swim', 5, 20, 10, 55, 15, 20, 80),
(130, 'Gyarados', 'Intimidate', 28, 95, 125, 79, 60, 100, 81),
(131, 'Lapras', 'Water Absorb', 5, 130, 85, 80, 85, 95, 60),
(132, 'Ditto', 'Limber', 5, 48, 48, 48, 48, 48, 48),
(133, 'Eevee', 'Run Away', 5, 55, 55, 50, 45, 65, 55),
(134, 'Vaporeon', 'Water Absorb', 28, 130, 65, 60, 110, 95, 65),
(135, 'Jolteon', 'Volt Absorb', 28, 65, 65, 60, 110, 95, 130),
(136, 'Flareon', 'Flash Fire', 28, 65, 130, 60, 95, 110, 65),
(137, 'Porygon', 'Trace', 5, 65, 60, 70, 85, 75, 40),
(138, 'Omanyte', 'Swift Swim', 5, 35, 40, 100, 90, 55, 35),
(139, 'Omastar', 'Swift Swim', 28, 70, 60, 125, 115, 70, 55),
(140, 'Kabuto', 'Swift Swim', 5, 30, 80, 90, 55, 45, 55),
(141, 'Kabutops', 'Swift Swim', 28, 60, 115, 105, 65, 70, 80),
(142, 'Aerodactyl', 'Rock Head', 28, 80, 105, 65, 60, 75, 130),
(143, 'Snorlax', 'Immunity', 5, 160, 110, 65, 65, 110, 30),
(144, 'Articuno', 'Pressure', 50, 90, 85, 100, 95, 125, 85),
(145, 'Zapdos', 'Pressure', 50, 90, 90, 85, 125, 90, 100),
(146, 'Moltres', 'Pressure', 50, 90, 100, 90, 125, 85, 90),
(147, 'Dratini', 'Shed Skin', 5, 41, 64, 45, 50, 50, 50),
(148, 'Dragonair', 'Shed Skin', 30, 61, 84, 65, 70, 70, 70),
(149, 'Dragonite', 'Inner Focus', 55, 91, 134, 95, 100, 100, 80),
(150, 'Mewtwo', 'Pressure', 70, 106, 110, 90, 154, 90, 130),
(151, 'Mew', 'Synchronize', 50, 100, 100, 100, 100, 100, 100);

-- --------------------------------------------------------
--
-- Table structure for table `Egg_Group`
--
DROP TABLE IF EXISTS Egg_Group;
CREATE TABLE IF NOT EXISTS Egg_Group (
  egg_group_name VARCHAR(40) PRIMARY KEY
);

--
-- Dumping data for table `Egg_Group`
--
INSERT INTO Egg_Group (egg_group_name) VALUES 
('Monster'), 
('Water 1'), 
('Bug'), 
('Flying'), 
('Field'), 
('Fairy'), 
('Grass'), 
('Human-Like'), 
('Water 3'), 
('Mineral'), 
('Amorphous'), 
('Water 2'), 
('Ditto'), 
('Dragon'), 
('Undiscovered');

-- --------------------------------------------------------
--
-- Table structure for table `Pokemon_Egg_Groups`
--
DROP TABLE IF EXISTS Pokemon_Egg_Groups;
CREATE TABLE IF NOT EXISTS Pokemon_Egg_Groups (
  u_id INTEGER,
  egg_group_name VARCHAR(40) ,
  FOREIGN KEY (u_id) REFERENCES Pokemon (u_id),
  FOREIGN KEY (egg_group_name) REFERENCES Egg_Group (egg_group_name),
  PRIMARY KEY (u_id, egg_group_name)
);


--
-- Dumping data for table `Pokemon_Egg_Groups`
--
INSERT INTO Pokemon_Egg_Groups (u_id, egg_group_name) VALUES 
(1, 'Monster'), (1, 'Grass'), 
(2, 'Monster'), (2, 'Grass'), 
(3, 'Monster'), (3, 'Grass'), 
(4, 'Monster'), (4, 'Dragon'), 
(5, 'Monster'), (5, 'Dragon'), 
(6, 'Monster'), (6, 'Dragon'), 
(7, 'Monster'), (7, 'Water 1'), 
(8, 'Monster'), (8, 'Water 1'), 
(9, 'Monster'), (9, 'Water 1'), 
(10, 'Bug'), 
(11, 'Bug'), 
(12, 'Bug'), 
(13, 'Bug'), 
(14, 'Bug'), 
(15, 'Bug'), 
(16, 'Flying'), 
(17, 'Flying'), 
(18, 'Flying'), 
(19, 'Field'), 
(20, 'Field'), 
(21, 'Flying'), 
(22, 'Flying'), 
(23, 'Field'), 
(24, 'Field'), 
(25, 'Field'), 
(26, 'Field'), 
(27, 'Field'), 
(28, 'Field'), 
(29, 'Monster'), (29, 'Field'), 
(30, 'Monster'), (30, 'Field'), 
(31, 'Monster'), (31, 'Field'), 
(32, 'Bug'), (32, 'Flying'), 
(33, 'Fairy'), 
(34, 'Fairy'), 
(35, 'Flying'), 
(36, 'Flying'), 
(37, 'Grass'), (37, 'Field'), 
(38, 'Grass'), (38, 'Field'), 
(39, 'Grass'), (39, 'Field'), 
(40, 'Bug'), (40, 'Grass'), 
(41, 'Bug'), (41, 'Grass'), 
(42, 'Bug'), (42, 'Poison'), 
(43, 'Bug'), (43, 'Poison'), 
(44, 'Ground'), 
(45, 'Ground'), 
(46, 'Field'), 
(47, 'Field'), 
(48, 'Water 1'), 
(49, 'Water 1'), 
(50, 'Fighting'), 
(51, 'Fighting'), 
(52, 'Field'), 
(53, 'Field'), 
(54, 'Water 1'), 
(55, 'Water 1'), 
(56, 'Water 1'), (56, 'Fighting'), 
(57, 'Human-Like'), 
(58, 'Human-Like'), 
(59, 'Human-Like'), 
(60, 'Human-Like'), 
(61, 'Human-Like'), 
(62, 'Human-Like'),
(63, 'Field'), (63, 'Fairy'),
(64, 'Field'), (64, 'Fairy'),
(65, 'Field'), (65, 'Fairy'),
(66, 'Human-Like'),
(67, 'Human-Like'),
(68, 'Human-Like'),
(69, 'Grass'), (69, 'Fairy'),
(70, 'Grass'), (70, 'Fairy'),
(71, 'Grass'), (71, 'Fairy'),
(72, 'Water 3'),
(73, 'Water 3'),
(74, 'Mineral'),
(75, 'Mineral'),
(76, 'Mineral'),
(77, 'Field'),
(78, 'Field'),
(79, 'Monster'), (79, 'Water 1'),
(80, 'Monster'), (80, 'Water 1'),
(81, 'Mineral'),
(82, 'Mineral'),
(83, 'Flying'), (83, 'Field'),
(84, 'Flying'),
(85, 'Flying'),
(86, 'Water 1'), (86, 'Field'),
(87, 'Water 1'), (87, 'Field'),
(88, 'Amorphous'),
(89, 'Amorphous'),
(90, 'Water 3'),
(91, 'Water 3'),
(92, 'Amorphous'),
(93, 'Amorphous'),
(94, 'Amorphous'),
(95, 'Mineral'),
(96, 'Human-Like'),
(97, 'Human-Like'),
(98, 'Water 3'),
(99, 'Water 3'),
(100, 'Mineral'),
(101, 'Mineral'),
(102, 'Grass'),
(103, 'Grass'),
(104, 'Monster'),
(105, 'Monster'),
(106, 'Human-Like'),
(107, 'Human-Like'),
(108, 'Monster'),
(109, 'Amorphous'),
(110, 'Amorphous'),
(111, 'Monster'), (111, 'Field'),
(112, 'Monster'), (112, 'Field'),
(113, 'Fairy'),
(114, 'Grass'),
(115, 'Monster'),
(116, 'Water 1'), (116, 'Dragon'),
(117, 'Water 1'), (117, 'Dragon'),
(118, 'Water 2'),
(119, 'Water 2'),
(120, 'Water 3'),
(121, 'Water 3'),
(122, 'Human-Like'),
(123, 'Bug'), (123, 'Flying'),
(124, 'Human-Like'),
(125, 'Human-Like'),
(126, 'Human-Like'),
(127, 'Bug'),
(128, 'Field'),
(129, 'Water 2'), (129, 'Dragon'),
(130, 'Water 2'), (130, 'Dragon'),
(131, 'Monster'), (131, 'Water 1'),
(132, 'Ditto'),
(133, 'Field'),
(134, 'Field'),
(135, 'Field'),
(136, 'Field'),
(137, 'Mineral'),
(138, 'Water 1'), (138, 'Water 3'),
(139, 'Water 1'), (139, 'Water 3'),
(140, 'Water 1'), (140, 'Water 3'),
(141, 'Water 1'), (141, 'Water 3'),
(142, 'Flying'),
(143, 'Monster'),
(144, 'Undiscovered'),
(145, 'Undiscovered'),
(146, 'Undiscovered'),
(147, 'Water 1'), (147, 'Dragon'),
(148, 'Water 1'), (148, 'Dragon'),
(149, 'Water 1'), (149, 'Dragon'),
(150, 'Undiscovered'),
(151, 'Undiscovered');

-- --------------------------------------------------------
--
-- Table structure for table `Trainer_pkmn`
--
DROP TABLE IF EXISTS  Trainer_pkmn;
CREATE TABLE IF NOT EXISTS Trainer_pkmn (
  trainer_id INTEGER,
  u_id INTEGER,
  FOREIGN KEY (trainer_id) REFERENCES Trainer (trainer_id),
  FOREIGN KEY (u_id) REFERENCES Pokemon (u_id),
  PRIMARY KEY (trainer_id, u_id)
);

--
-- Dumping data for table ` Trainer_pkmn`
--
INSERT INTO Trainer_pkmn (trainer_id, u_id) VALUES 
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6),
(2, 7), (2, 8), (2, 9), (2, 10), (2, 11), (2, 12),
(3, 13),
(4, 14), (4, 15), (4, 16), (4, 17), (4, 18),
(5, 19),
(6, 20), (6, 21), (6, 22), (6, 23), (6, 24), (6, 25),
(7, 26), (7, 27),
(8, 28), (8, 29), (8, 30), (8, 31), (8, 32), (8, 33),
(9, 34), (9, 35),
(10, 36), (10, 37), (10, 38), (10, 39), (10, 40),
(11, 41),
(12, 42), (12, 43), (12, 44), (12, 45), (12, 46),
(13, 47), (13, 48), (13, 49), (13, 50),
(14, 51), (14, 52), (14, 53),
(15, 54), (15, 55), (15, 56), (15, 57), (15, 58), (15, 59);

-- --------------------------------------------------------
--
-- Table structure for table `In_World_Type`
--
DROP TABLE IF EXISTS In_World_Type;
CREATE TABLE IF NOT EXISTS In_World_Type (
  type_name VARCHAR(40) PRIMARY KEY,
  type_description VARCHAR(300) NOT NULL
);

--
-- Dumping data for table `In_World_Type`
--
INSERT INTO In_World_Type (type_name, type_description) VALUES 
('Normal', 'Basic type with no special attributes.'),
('Fire', 'Strong against Grass, Bug, Ice, and Steel types.'),
('Water', 'Strong against Fire, Ground, and Rock types.'),
('Electric', 'Strong against Water and Flying types.'),
('Grass', 'Strong against Water, Ground, and Rock types.'),
('Ice', 'Strong against Grass, Ground, Flying, and Dragon types.'),
('Fighting', 'Strong against Normal, Ice, Rock, Dark, and Steel types.'),
('Poison', 'Strong against Grass and Fairy types.'),
('Ground', 'Strong against Fire, Electric, Poison, Rock, and Steel types.'),
('Flying', 'Strong against Grass, Fighting, and Bug types.'),
('Psychic', 'Strong against Fighting and Poison types.'),
('Bug', 'Strong against Grass, Psychic, and Dark types.'),
('Rock', 'Strong against Fire, Ice, Flying, and Bug types.'),
('Ghost', 'Strong against Ghost and Psychic types.'),
('Dragon', 'Strong against Dragon types.'),
('Dark', 'Strong against Psychic and Ghost types.'),
('Steel', 'Strong against Ice, Rock, and Fairy types.'),
('Fairy', 'Strong against Fighting, Dragon, and Dark types.');

-- --------------------------------------------------------
--
-- Table structure for table ` Type_Weaknesses `
--
DROP TABLE IF EXISTS  Type_Weaknesses;
CREATE TABLE IF NOT EXISTS Type_Weaknesses (
  type_name VARCHAR(40),
  weak_to_type VARCHAR(40),
  FOREIGN KEY (type_name) REFERENCES In_World_Type (type_name),
  FOREIGN KEY (weak_to_type) REFERENCES In_World_Type (type_name),
  PRIMARY KEY (type_name, weak_to_type) 
);

--
-- Dumping data for table `Type_Weaknesses`
--
INSERT INTO Type_Weaknesses (type_name, weak_to_type) VALUES 
('Normal', 'Fighting'), 
('Fire', 'Water'), ('Fire', 'Ground'), ('Fire', 'Rock'), 
('Water', 'Electric'), ('Water', 'Grass'), 
('Electric', 'Ground'), 
('Grass', 'Fire'), ('Grass', 'Ice'), ('Grass', 'Poison'), ('Grass', 'Flying'), ('Grass', 'Bug'), 
('Ice', 'Fire'), ('Ice', 'Fighting'), ('Ice', 'Rock'), ('Ice', 'Steel'), 
('Fighting', 'Flying'), ('Fighting', 'Psychic'), ('Fighting', 'Fairy'), 
('Poison', 'Ground'), ('Poison', 'Psychic'), 
('Ground', 'Water'), ('Ground', 'Grass'), ('Ground', 'Ice'), 
('Flying', 'Electric'), ('Flying', 'Ice'), ('Flying', 'Rock'), 
('Psychic', 'Bug'), ('Psychic', 'Ghost'), ('Psychic', 'Dark'), 
('Bug', 'Fire'), ('Bug', 'Flying'), ('Bug', 'Rock'), 
('Rock', 'Water'), ('Rock', 'Grass'), ('Rock', 'Fighting'), ('Rock', 'Ground'), ('Rock', 'Steel'), 
('Ghost', 'Ghost'), ('Ghost', 'Dark'), 
('Dragon', 'Ice'), ('Dragon', 'Dragon'), ('Dragon', 'Fairy'), 
('Dark', 'Fighting'), ('Dark', 'Bug'), ('Dark', 'Fairy'), 
('Steel', 'Fire'), ('Steel', 'Fighting'), ('Steel', 'Ground'), 
('Fairy', 'Poison'), ('Fairy', 'Steel');

-- --------------------------------------------------------
--
-- Table structure for table `Type_resistances`
--
DROP TABLE IF EXISTS Type_resistances;
CREATE TABLE IF NOT EXISTS Type_resistances (
  type_name VARCHAR(40),
  resists_type VARCHAR(40),
  FOREIGN KEY (type_name) REFERENCES In_World_Type (type_name),
  FOREIGN KEY (resists_type) REFERENCES In_World_Type (type_name),
  PRIMARY KEY (type_name, resists_type) 
);

--
-- Dumping data for table `Type_resistances`
--
INSERT INTO Type_resistances (type_name, resists_type) VALUES 
('Normal', 'None'), 
('Fire', 'Fire'), ('Fire', 'Grass'), ('Fire', 'Ice'), ('Fire', 'Bug'), ('Fire', 'Steel'), ('Fire', 'Fairy'), 
('Water', 'Fire'), ('Water', 'Water'), ('Water', 'Ice'), ('Water', 'Steel'), 
('Electric', 'Electric'), ('Electric', 'Flying'), ('Electric', 'Steel'), 
('Grass', 'Water'), ('Grass', 'Electric'), ('Grass', 'Grass'), ('Grass', 'Ground'), 
('Ice', 'Ice'), 
('Fighting', 'Bug'), ('Fighting', 'Rock'), ('Fighting', 'Dark'), 
('Poison', 'Grass'), ('Poison', 'Fighting'), ('Poison', 'Poison'), ('Poison', 'Bug'), ('Poison', 'Fairy'), 
('Ground', 'Poison'), ('Ground', 'Rock'), 
('Flying', 'Grass'), ('Flying', 'Fighting'), ('Flying', 'Bug'), 
('Psychic', 'Fighting'), ('Psychic', 'Psychic'), 
('Bug', 'Grass'), ('Bug', 'Fighting'), ('Bug', 'Ground'), 
('Rock', 'Normal'), ('Rock', 'Fire'), ('Rock', 'Poison'), ('Rock', 'Flying'), 
('Ghost', 'Poison'), ('Ghost', 'Bug'), 
('Dragon', 'Fire'), ('Dragon', 'Water'), ('Dragon', 'Electric'), ('Dragon', 'Grass'), 
('Dark', 'Ghost'), ('Dark', 'Dark'), 
('Steel', 'Normal'), ('Steel', 'Grass'), ('Steel', 'Ice'), ('Steel', 'Flying'), ('Steel', 'Psychic'), ('Steel', 'Bug'), ('Steel', 'Rock'), ('Steel', 'Dragon'), ('Steel', 'Steel'), ('Steel', 'Fairy'), 
('Fairy', 'Fighting'), ('Fairy', 'Bug'), ('Fairy', 'Dark');

-- --------------------------------------------------------
--
-- Table structure for table `Pkmn_type`
--
DROP TABLE IF EXISTS Pkmn_type;
CREATE TABLE IF NOT EXISTS Pkmn_type (
  u_id  INTEGER,
  type_name VARCHAR(40),
  FOREIGN KEY (u_id ) REFERENCES Pokemon (u_id ),
  FOREIGN KEY (type_name) REFERENCES Type (type_name),
  PRIMARY KEY (u_id , type_name) 
);

--
-- Dumping data for table `Pkmn_type`
--
INSERT INTO Pkmn_type (u_id, type_name) VALUES 
(1, 'Grass'), (1, 'Poison'), 
(2, 'Grass'), (2, 'Poison'), 
(3, 'Grass'), (3, 'Poison'), 
(4, 'Fire'), 
(5, 'Fire'), 
(6, 'Fire'), (6, 'Flying'), 
(7, 'Water'), 
(8, 'Water'), 
(9, 'Water'), 
(10, 'Bug'), 
(11, 'Bug'), 
(12, 'Bug'), 
(13, 'Bug'), 
(14, 'Bug'), 
(15, 'Bug'), 
(16, 'Flying'), 
(17, 'Flying'), 
(18, 'Flying'), 
(19, 'Field'), 
(20, 'Field'), 
(21, 'Flying'), 
(22, 'Flying'), 
(23, 'Field'), 
(24, 'Field'), 
(25, 'Field'), 
(26, 'Field'), 
(27, 'Field'), 
(28, 'Field'), 
(29, 'Monster'), (29, 'Field'), 
(30, 'Monster'), (30, 'Field'), 
(31, 'Monster'), (31, 'Field'), 
(32, 'Bug'), 
(33, 'Fairy'), 
(34, 'Fairy'), 
(35, 'Poison'), 
(36, 'Poison'), 
(37, 'Grass'), (37, 'Poison'), 
(38, 'Grass'), (38, 'Poison'), 
(39, 'Grass'), (39, 'Poison'), 
(40, 'Bug'), 
(41, 'Bug'), 
(42, 'Bug'), (42, 'Poison'), 
(43, 'Bug'), (43, 'Poison'), 
(44, 'Ground'), 
(45, 'Ground'), 
(46, 'Field'), 
(47, 'Field'), 
(48, 'Water 1'), 
(49, 'Water 1'), 
(50, 'Fighting'), 
(51, 'Fighting'), 
(52, 'Field'), 
(53, 'Field'), 
(54, 'Water 1'), 
(55, 'Water 1'), 
(56, 'Water 1'), (56, 'Fighting'), 
(57, 'Human-Like'), 
(58, 'Human-Like'), 
(59, 'Human-Like'), 
(60, 'Human-Like'), 
(61, 'Human-Like'), 
(62, 'Human-Like'),
(63, 'Field'), (63, 'Fairy'),
(64, 'Field'), (64, 'Fairy'),
(65, 'Field'), (65, 'Fairy'),
(66, 'Human-Like'),
(67, 'Human-Like'),
(68, 'Human-Like'),
(69, 'Grass'), (69, 'Fairy'),
(70, 'Grass'), (70, 'Fairy'),
(71, 'Grass'), (71, 'Fairy'),
(72, 'Water 3'),
(73, 'Water 3'),
(74, 'Mineral'),
(75, 'Mineral'),
(76, 'Mineral'),
(77, 'Field'),
(78, 'Field'),
(79, 'Monster'), (79, 'Water 1'),
(80, 'Monster'), (80, 'Water 1'),
(81, 'Mineral'),
(82, 'Mineral'),
(83, 'Flying'), (83, 'Field'),
(84, 'Flying'),
(85, 'Flying'),
(86, 'Water 1'), (86, 'Field'),
(87, 'Water 1'), (87, 'Field'),
(88, 'Amorphous'),
(89, 'Amorphous'),
(90, 'Water 3'),
(91, 'Water 3'),
(92, 'Amorphous'),
(93, 'Amorphous'),
(94, 'Amorphous'),
(95, 'Mineral'),
(96, 'Human-Like'),
(97, 'Human-Like'),
(98, 'Water 3'),
(99, 'Water 3'),
(100, 'Mineral'),
(101, 'Mineral'),
(102, 'Grass'),
(103, 'Grass'),
(104, 'Monster'),
(105, 'Monster'),
(106, 'Human-Like'),
(107, 'Human-Like'),
(108, 'Monster'),
(109, 'Amorphous'),
(110, 'Amorphous'),
(111, 'Monster'), (111, 'Field'),
(112, 'Monster'), (112, 'Field'),
(113, 'Fairy'),
(114, 'Grass'),
(115, 'Monster'),
(116, 'Water 1'), (116, 'Dragon'),
(117, 'Water 1'), (117, 'Dragon'),
(118, 'Water 2'),
(119, 'Water 2'),
(120, 'Water 3'),
(121, 'Water 3'),
(122, 'Human-Like'),
(123, 'Bug'), (123, 'Flying'),
(124, 'Human-Like'),
(125, 'Human-Like'),
(126, 'Human-Like'),
(127, 'Bug'),
(128, 'Field'),
(129, 'Water 2'), (129, 'Dragon'),
(130, 'Water 2'), (130, 'Dragon'),
(131, 'Monster'), (131, 'Water 1'),
(132, 'Ditto'),
(133, 'Field'),
(134, 'Field'),
(135, 'Field'),
(136, 'Field'),
(137, 'Mineral'),
(138, 'Water 1'), (138, 'Water 3'),
(139, 'Water 1'), (139, 'Water 3'),
(140, 'Water 1'), (140, 'Water 3'),
(141, 'Water 1'), (141, 'Water 3'),
(142, 'Flying'),
(143, 'Monster'),
(144, 'Ice'), (144, 'Flying'),
(145, 'Electric'), (145, 'Flying'),
(146, 'Fire'), (146, 'Flying'),
(147, 'Dragon'), (147, 'Water 1'),
(148, 'Dragon'), (148, 'Water 1'),
(149, 'Dragon'), (149, 'Water 1'),
(150, 'Psychic'),
(151, 'Psychic');

-- --------------------------------------------------------
--
-- Table structure for table `In_World_Move`
--
DROP TABLE IF EXISTS In_World_Move;
CREATE TABLE IF NOT EXISTS In_World_Move (
  move_name VARCHAR(40) PRIMARY KEY,
  base_power INTEGER CHECK (base_power <= 200 AND base_power >= 0),
  power_type VARCHAR(40),
  move_description VARCHAR(300),
  FOREIGN KEY (power_type) REFERENCES In_World_Type (type_name)
);

--
-- Dumping data for table `In_World_Move`
--
INSERT INTO In_World_Move (move_name, base_power, power_type, move_description) VALUES 
('Tackle', 40, 'Normal', 'A physical attack in which the user charges and slams into the target with its whole body.'),
('Vine Whip', 45, 'Grass', 'The target is struck with slender, whiplike vines to inflict damage.'),
('Ember', 40, 'Fire', 'The target is attacked with small flames. This may also leave the target with a burn.'),
('Water Gun', 40, 'Water', 'The target is blasted with a forceful shot of water.'),
('Thunder Shock', 40, 'Electric', 'A jolt of electricity crashes down on the target to inflict damage. This may also leave the target with paralysis.'),
('Quick Attack', 40, 'Normal', 'The user lunges at the target at a speed that makes it almost invisible. This move always goes first.'),
('Razor Leaf', 55, 'Grass', 'Sharp-edged leaves are launched to slash at the opposing Pokémon. Critical hits land more easily.'),
('Flamethrower', 90, 'Fire', 'The target is scorched with an intense blast of fire. This may also leave the target with a burn.'),
('Hydro Pump', 110, 'Water', 'The target is blasted by a huge volume of water launched under great pressure.'),
('Thunderbolt', 90, 'Electric', 'A strong electric blast crashes down on the target. This may also leave the target with paralysis.'),
('Hyper Beam', 150, 'Normal', 'The target is attacked with a powerful beam. The user can’t move on the next turn.'),
('Solar Beam', 120, 'Grass', 'A two-turn attack. The user gathers light, then blasts a bundled beam on the next turn.'),
('Fire Blast', 110, 'Fire', 'The target is attacked with an intense blast of all-consuming fire. This may also leave the target with a burn.'),
('Surf', 90, 'Water', 'The user attacks everything around it by swamping its surroundings with a giant wave.'),
('Thunder', 110, 'Electric', 'A wicked thunderbolt is dropped on the target to inflict damage. This may also leave the target with paralysis.'),
('Swift', 60, 'Normal', 'Star-shaped rays are shot at the opposing Pokémon. This attack never misses.'),
('Sleep Powder', 0, 'Grass', 'The user scatters a big cloud of sleep-inducing dust around the target.'),
('Will-O-Wisp', 0, 'Fire', 'The user shoots a sinister, bluish-white flame at the target to inflict a burn.'),
('Ice Beam', 90, 'Ice', 'The target is struck with an icy-cold beam of energy. This may also leave the target frozen.'),
('Blizzard', 110, 'Ice', 'A howling blizzard is summoned to strike opposing Pokémon. This may also leave the target frozen.'),
('Close Combat', 120, 'Fighting', 'The user fights the target up close without guarding itself. This also lowers the user’s Defense and Sp. Def stats.'),
('Sludge Bomb', 90, 'Poison', 'Unsanitary sludge is hurled at the target to inflict damage. This may also poison the target.'),
('Earthquake', 100, 'Ground', 'The user sets off an earthquake that strikes every Pokémon around it.'),
('Fly', 90, 'Flying', 'The user soars, then strikes its target on the next turn.'),
('Psychic', 90, 'Psychic', 'The target is hit by a strong telekinetic force. This may also lower the target’s Sp. Def stat.'),
('Bug Buzz', 90, 'Bug', 'The user generates a damaging sound wave by vibration. This may also lower the target’s Sp. Def stat.'),
('Rock Slide', 75, 'Rock', 'Large boulders are hurled at the opposing Pokémon to inflict damage. This may also make the opposing Pokémon flinch.'),
('Shadow Ball', 80, 'Ghost', 'The user hurls a shadowy blob at the target. This may also lower the target’s Sp. Def stat.'),
('Dragon Claw', 80, 'Dragon', 'The user slashes the target with huge sharp claws.'),
('Dark Pulse', 80, 'Dark', 'The user releases a horrible aura imbued with dark thoughts. This may also make the target flinch.'),
('Flash Cannon', 80, 'Steel', 'The user gathers all its light energy and releases it at once. This may also lower the target’s Sp. Def stat.'),
('Moonblast', 95, 'Fairy', 'Borrowing the power of the moon, the user attacks the target. This may also lower the target’s Sp. Atk stat.'),
('Iron Tail', 100, 'Steel', 'The target is slammed with a steel-hard tail. This may also lower the target’s Defense stat.'),
('Play Rough', 90, 'Fairy', 'The user plays rough with the target and attacks it. This may also lower the target’s Attack stat.'),
('Aerial Ace', 60, 'Flying', 'The user confounds the target with speed, then slashes. This attack never misses.'),
('Shadow Claw', 70, 'Ghost', 'The user slashes with a sharp claw made from shadows. Critical hits land more easily.'),
('Brick Break', 75, 'Fighting', 'The user attacks with a swift chop. It can also break barriers, such as Light Screen and Reflect.'),
('Earth Power', 90, 'Ground', 'The user makes the ground under the target erupt with power. This may also lower the target’s Sp. Def stat.'),
('Energy Ball', 90, 'Grass', 'The user draws power from nature and fires it at the target. This may also lower the target’s Sp. Def stat.'),
('Ice Punch', 75, 'Ice', 'The target is punched with an icy fist. This may also leave the target frozen.'),
('Fire Punch', 75, 'Fire', 'The target is punched with a fiery fist. This may also leave the target with a burn.'),
('Thunder Punch', 75, 'Electric', 'The target is punched with an electrified fist. This may also leave the target with paralysis.'),
('Drain Punch', 75, 'Fighting', 'An energy-draining punch. The user’s HP is restored by half the damage taken by the target.'),
('Poison Jab', 80, 'Poison', 'The target is stabbed with a tentacle or arm steeped in poison. This may also poison the target.'),
('Stone Edge', 100, 'Rock', 'The user stabs the target with sharpened stones from below. Critical hits land more easily.'),
('X-Scissor', 80, 'Bug', 'The user slashes at the target by crossing its scythes or claws as if they were a pair of scissors.'),
('Waterfall', 80, 'Water', 'The user charges at the target and may make it flinch.'),
('Body Slam', 85, 'Normal', 'The user drops onto the target with its full body weight. This may also leave the target with paralysis.'),
('Bite', 60, 'Dark', 'The target is bitten with viciously sharp fangs. This may also make the target flinch.'),
('Crunch', 80, 'Dark', 'The user crunches up the target with sharp fangs. This may also lower the target’s Defense stat.'),
('Air Slash', 75, 'Flying', 'The user attacks with a blade of air that slices even the sky. This may also make the target flinch.'),
('Aura Sphere', 80, 'Fighting', 'The user lets loose a blast of aura power from deep within its body at the target. This attack never misses.'),
('Seed Bomb', 80, 'Grass', 'The user slams a barrage of hard-shelled seeds down on the target from above.'),
('Draco Meteor', 130, 'Dragon', 'Comets are summoned down from the sky onto the target. The attack’s recoil harshly lowers the user’s Sp. Atk stat.'),
('Thunder Wave', 0, 'Electric', 'The user launches a weak jolt of electricity that paralyzes the target.'),
('Toxic', 0, 'Poison', 'A move that leaves the target badly poisoned. Its poison damage worsens every turn.'),
('Stealth Rock', 0, 'Rock', 'The user lays a trap of levitating stones around the opposing team. The trap hurts opposing Pokémon that switch into battle.'),
('Leech Seed', 0, 'Grass', 'A seed is planted on the target. It steals some HP from the target every turn.'),
('Calm Mind', 0, 'Psychic', 'The user quietly focuses its mind and calms its spirit to raise its Sp. Atk and Sp. Def stats.'),
('Swords Dance', 0, 'Normal', 'A frenetic dance to uplift the fighting spirit. This sharply raises the user’s Attack stat.'),
('Substitute', 0, 'Normal', 'The user creates a substitute for itself using some of its HP. The substitute serves as the user’s decoy.');

-- --------------------------------------------------------
--
-- Table structure for table `Pkmn_move`
--
DROP TABLE IF EXISTS Pkmn_move;
CREATE TABLE IF NOT EXISTS Pkmn_move (
  u_id INTEGER,
  move_name VARCHAR(40),
  FOREIGN KEY (u_id) REFERENCES Pokemon (u_id),
  FOREIGN KEY (move_name) REFERENCES In_World_Move (move_name),
  PRIMARY KEY (u_id, move_name)
);

--
-- Dumping data for table `Pkmn_move`
--
INSERT INTO Pkmn_move (u_id, move_name) VALUES 
(1, 'Tackle'), (1, 'Vine Whip'), 
(2, 'Tackle'), (2, 'Vine Whip'), 
(3, 'Tackle'), (3, 'Vine Whip'), (3, 'Razor Leaf'), (3, 'Solar Beam'), 
(4, 'Tackle'), (4, 'Ember'), 
(5, 'Tackle'), (5, 'Ember'), 
(6, 'Tackle'), (6, 'Ember'), (6, 'Flamethrower'), (6, 'Fire Blast'), 
(7, 'Tackle'), (7, 'Water Gun'), 
(8, 'Tackle'), (8, 'Water Gun'), 
(9, 'Tackle'), (9, 'Water Gun'), (9, 'Surf'), (9, 'Hydro Pump'), 
(10, 'Tackle'), 
(11, 'Tackle'), 
(12, 'Tackle'), (12, 'Bug Buzz'), (12, 'Sleep Powder'), 
(13, 'Tackle'), 
(14, 'Tackle'), 
(15, 'Tackle'), (15, 'X-Scissor'), 
(16, 'Tackle'), (16, 'Quick Attack'), 
(17, 'Tackle'), (17, 'Quick Attack'), 
(18, 'Tackle'), (18, 'Quick Attack'), 
(19, 'Tackle'), (19, 'Hyper Beam'), 
(20, 'Tackle'), (20, 'Hyper Beam'), 
(21, 'Tackle'), 
(22, 'Tackle'), 
(23, 'Tackle'), 
(24, 'Tackle'), 
(25, 'Tackle'), (25, 'Thunder Shock'), 
(26, 'Tackle'), (26, 'Thunder Shock'), (26, 'Thunderbolt'), (26, 'Thunder'), 
(27, 'Tackle'), 
(28, 'Tackle'), 
(29, 'Tackle'), 
(30, 'Tackle'), 
(31, 'Tackle'), 
(32, 'Tackle'), (32, 'Quick Attack'), (32, 'Razor Leaf'), 
(33, 'Tackle'), 
(34, 'Tackle'), 
(35, 'Tackle'), 
(36, 'Tackle'), 
(37, 'Tackle'), (37, 'Vine Whip'), (37, 'Razor Leaf'), 
(38, 'Tackle'), (38, 'Vine Whip'), 
(39, 'Tackle'), (39, 'Vine Whip'), (39, 'Razor Leaf'), 
(40, 'Tackle'), 
(41, 'Tackle'), 
(42, 'Tackle'), (42, 'Poison Powder'), (42, 'Leech Seed'), 
(43, 'Tackle'), (43, 'Poison Powder'), 
(44, 'Tackle'), 
(45, 'Tackle'), 
(46, 'Tackle'), 
(47, 'Tackle'), 
(48, 'Tackle'), 
(49, 'Tackle'), 
(50, 'Tackle'), 
(51, 'Tackle'), 
(52, 'Tackle'), 
(53, 'Tackle'), 
(54, 'Tackle'), 
(55, 'Tackle'), 
(56, 'Tackle'), 
(57, 'Tackle'), 
(58, 'Tackle'), 
(59, 'Tackle'), 
(60, 'Tackle'), 
(61, 'Tackle'), 
(62, 'Tackle'),
(63, 'Tackle'), (63, 'Tail Whip'), 
(64, 'Tackle'), (64, 'Tail Whip'), 
(65, 'Tackle'), (65, 'Tail Whip'), 
(66, 'Tackle'), (66, 'Karate Chop'), 
(67, 'Tackle'), (67, 'Karate Chop'), 
(68, 'Tackle'), (68, 'Karate Chop'), (68, 'Cross Chop'), 
(69, 'Tackle'), (69, 'Vine Whip'), (69, 'Wrap'), 
(70, 'Tackle'), (70, 'Vine Whip'), (70, 'Wrap'), 
(71, 'Tackle'), (71, 'Vine Whip'), (71, 'Wrap'), (71, 'Razor Leaf'), 
(72, 'Tackle'), (72, 'Bubble'), 
(73, 'Tackle'), (73, 'Bubble'), 
(74, 'Tackle'), (74, 'Defense Curl'), 
(75, 'Tackle'), (75, 'Defense Curl'), 
(76, 'Tackle'), (76, 'Defense Curl'), (76, 'Rock Slide'), 
(77, 'Tackle'), (77, 'Ember'), 
(78, 'Tackle'), (78, 'Ember'), 
(79, 'Tackle'), (79, 'Water Gun'), 
(80, 'Tackle'), (80, 'Water Gun'), 
(81, 'Tackle'), 
(82, 'Tackle'), 
(83, 'Tackle'), (83, 'Peck'), 
(84, 'Tackle'), 
(85, 'Tackle'), 
(86, 'Tackle'), 
(87, 'Tackle'), 
(88, 'Tackle'), 
(89, 'Tackle'), 
(90, 'Tackle'), 
(91, 'Tackle'), 
(92, 'Tackle'), 
(93, 'Tackle'), 
(94, 'Tackle'), (94, 'Lick'), 
(95, 'Tackle'), 
(96, 'Tackle'), (96, 'Hypnosis'), 
(97, 'Tackle'), (97, 'Hypnosis'), 
(98, 'Tackle'), (98, 'Bubble'), 
(99, 'Tackle'), (99, 'Bubble'), 
(100, 'Tackle'), 
(101, 'Tackle'), 
(102, 'Tackle'), 
(103, 'Tackle'), 
(104, 'Tackle'), 
(105, 'Tackle'), 
(106, 'Tackle'), (106, 'High Jump Kick'), 
(107, 'Tackle'), (107, 'Punch'), 
(108, 'Tackle'), 
(109, 'Tackle'), 
(110, 'Tackle'), 
(111, 'Tackle'), 
(112, 'Tackle'), 
(113, 'Tackle'), 
(114, 'Tackle'), 
(115, 'Tackle'), 
(116, 'Tackle'), 
(117, 'Tackle'), 
(118, 'Tackle'), 
(119, 'Tackle'), 
(120, 'Tackle'), 
(121, 'Tackle'), 
(122, 'Tackle'), 
(123, 'Tackle'), (123, 'Slash'), 
(124, 'Tackle'), 
(125, 'Tackle'), 
(126, 'Tackle'), 
(127, 'Tackle'), 
(128, 'Tackle'), 
(129, 'Tackle'), (129, 'Splash'), 
(130, 'Tackle'), 
(131, 'Tackle'), 
(132, 'Tackle'), 
(133, 'Tackle'), 
(134, 'Tackle'), 
(135, 'Tackle'), 
(136, 'Tackle'), 
(137, 'Tackle'), 
(138, 'Tackle'), 
(139, 'Tackle'), 
(140, 'Tackle'), 
(141, 'Tackle'), 
(142, 'Tackle'), 
(143, 'Tackle'), 
(144, 'Tackle'), 
(145, 'Tackle'), 
(146, 'Tackle'), 
(147, 'Tackle'), (147, 'Dragon Breath'), 
(148, 'Tackle'), (148, 'Dragon Breath'), 
(149, 'Tackle'), (149, 'Dragon Breath'), (149, 'Hyper Beam'), 
(150, 'Tackle'), (150, 'Psycho Cut'), 
(151, 'Tackle'), (151, 'Psycho Cut'), (151, 'Mega Punch'), (151, 'Transform');

-- --------------------------------------------------------
--
-- Table structure for table `Legendary_pkmn`
--
DROP TABLE IF EXISTS Legendary_pkmn;
CREATE TABLE IF NOT EXISTS Legendary_pkmn (
  u_id INTEGER PRIMARY KEY,
  FOREIGN KEY (u_id) REFERENCES Pokemon (u_id)
);

--
-- Dumping data for table `Legendary_pkmn`
--
-- Insert queries for legendary Pokémon
INSERT INTO Legendary_pkmn (u_id) VALUES (144); -- Articuno
INSERT INTO Legendary_pkmn (u_id) VALUES (145); -- Zapdos
INSERT INTO Legendary_pkmn (u_id) VALUES (146); -- Moltres
INSERT INTO Legendary_pkmn (u_id) VALUES (150); -- Mewtwo
INSERT INTO Legendary_pkmn (u_id) VALUES (151); -- Mew
