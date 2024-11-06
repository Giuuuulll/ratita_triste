/*-- Wed Oct 16 10:45:32 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tienda_informatica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tienda_informatica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tienda_informatica` DEFAULT CHARACTER SET utf8 ;
USE `tienda_informatica` ;

-- -----------------------------------------------------
-- Table `tienda_informatica`.`fabricante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_informatica`.`fabricante` (
  `codigo` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_informatica`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_informatica`.`producto` (
  `codigo` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `fabricante_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_+_fabricante_idx` (`fabricante_codigo` ASC) ,
  CONSTRAINT `fk_+_fabricante`
    FOREIGN KEY (`fabricante_codigo`)
    REFERENCES `tienda_informatica`.`fabricante` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `tienda_informatica` ;

-- -----------------------------------------------------
-- Placeholder table for view `tienda_informatica`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_informatica`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `tienda_informatica`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tienda_informatica`.`view1`;
USE `tienda_informatica`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;*/




/*select nombre from producto;*/
/*select * from producto;*/
/*select producto.nombre,fabricante.nombre from producto, fabricante where producto.fabricante_codigo=fabricante.codigo;*/
/*select nombre,precio from producto;*/
/*select nombre ,precio  * 249 AS 'precio EUR' , precio * 224 AS 'precio USD' from producto;*/
/*lect nombre AS 'nombre de productos', precio * 249 AS  'euros', precio * 224 AS 'USD'from  producto;*/
/*select f.nombre, upper(substr(f.nombre,1,2)) as 'nombre 2' from fabricante f;*/
/*select nombre, round(precio) as 'precio' from producto;*/
/*select nombre, truncate(precio,0) as 'precio' from producto;*/
/*select f.codigo from fabricante f , producto p where f.codigo=p.fabricante_codigo;*/
