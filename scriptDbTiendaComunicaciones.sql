-- MySQL Script generated by MySQL Workbench
-- jue 27 abr 2023 10:01:15
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db TiendaFisica
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `db TiendaFisica` ;

-- -----------------------------------------------------
-- Schema db TiendaFisica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db TiendaFisica` ;
USE `db TiendaFisica` ;

-- -----------------------------------------------------
-- Table `db TiendaFisica`.`Categoria_Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db TiendaFisica`.`Categoria_Cliente` ;

CREATE TABLE IF NOT EXISTS `db TiendaFisica`.`Categoria_Cliente` (
  `idCategoria_Cliente` INT NOT NULL,
  `Nombre_Categoria` VARCHAR(45) NULL,
  PRIMARY KEY (`idCategoria_Cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db TiendaFisica`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db TiendaFisica`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `db TiendaFisica`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Telefono` INT(20) NULL,
  `Categoria_Cliente_idCategoria_Cliente` INT NOT NULL,
  PRIMARY KEY (`idCliente`, `Categoria_Cliente_idCategoria_Cliente`),
  INDEX `fk_Cliente_Categoria_Cliente_idx` (`Categoria_Cliente_idCategoria_Cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Categoria_Cliente`
    FOREIGN KEY (`Categoria_Cliente_idCategoria_Cliente`)
    REFERENCES `db TiendaFisica`.`Categoria_Cliente` (`idCategoria_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db TiendaFisica`.`Detalle de compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db TiendaFisica`.`Detalle de compra` ;

CREATE TABLE IF NOT EXISTS `db TiendaFisica`.`Detalle de compra` (
  `Factura-de-Compra_idFactura-de-Compra` INT NOT NULL,
  `Producto_idProducto` INT NOT NULL,
  `Cantidad-producto` INT NULL,
  `Total-por-cada-Producto` DECIMAL NULL,
  PRIMARY KEY (`Factura-de-Compra_idFactura-de-Compra`, `Producto_idProducto`),
  INDEX `fk_Factura-de-Compra_has_Producto_Producto1_idx` (`Producto_idProducto` ASC) VISIBLE,
  INDEX `fk_Factura-de-Compra_has_Producto_Factura-de-Compra1_idx` (`Factura-de-Compra_idFactura-de-Compra` ASC) VISIBLE,
  CONSTRAINT `fk_Factura-de-Compra_has_Producto_Factura-de-Compra1`
    FOREIGN KEY (`Factura-de-Compra_idFactura-de-Compra`)
    REFERENCES `db TiendaFisica`.`Factura-de-Compra` (`idFactura-de-Compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura-de-Compra_has_Producto_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `db TiendaFisica`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db TiendaFisica`.`Detalle_Facturacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db TiendaFisica`.`Detalle_Facturacion` ;

CREATE TABLE IF NOT EXISTS `db TiendaFisica`.`Detalle_Facturacion` (
  `Factura_de_Venta_idFactura_de_Venta` INT NOT NULL,
  `Factura_de_Venta_Cliente_idCliente` INT NOT NULL,
  `Factura_de_Venta_Cliente_Categoria_Cliente_idCategoria_Cliente` INT NOT NULL,
  `Producto_idProducto` INT NOT NULL,
  `Cantidad-Pedido` INT NULL,
  `Total-Pedido` DOUBLE NULL,
  PRIMARY KEY (`Factura_de_Venta_idFactura_de_Venta`, `Factura_de_Venta_Cliente_idCliente`, `Factura_de_Venta_Cliente_Categoria_Cliente_idCategoria_Cliente`, `Producto_idProducto`),
  INDEX `fk_Factura_de_Venta_has_Producto_Producto1_idx` (`Producto_idProducto` ASC) VISIBLE,
  INDEX `fk_Factura_de_Venta_has_Producto_Factura_de_Venta1_idx` (`Factura_de_Venta_idFactura_de_Venta` ASC, `Factura_de_Venta_Cliente_idCliente` ASC, `Factura_de_Venta_Cliente_Categoria_Cliente_idCategoria_Cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Factura_de_Venta_has_Producto_Factura_de_Venta1`
    FOREIGN KEY (`Factura_de_Venta_idFactura_de_Venta` , `Factura_de_Venta_Cliente_idCliente` , `Factura_de_Venta_Cliente_Categoria_Cliente_idCategoria_Cliente`)
    REFERENCES `db TiendaFisica`.`Factura_de_Venta` (`idFactura_de_Venta` , `Cliente_idCliente` , `Cliente_Categoria_Cliente_idCategoria_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_de_Venta_has_Producto_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `db TiendaFisica`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db TiendaFisica`.`Detalles de servicio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db TiendaFisica`.`Detalles de servicio` ;

CREATE TABLE IF NOT EXISTS `db TiendaFisica`.`Detalles de servicio` (
  `Servicio_idServicio` INT NOT NULL,
  `Comprobante de servicio_idComprobante de servicio` INT NOT NULL,
  `Descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`Servicio_idServicio`, `Comprobante de servicio_idComprobante de servicio`),
  INDEX `fk_Servicio_has_Comprobante de servicio_Comprobante de serv_idx` (`Comprobante de servicio_idComprobante de servicio` ASC) VISIBLE,
  INDEX `fk_Servicio_has_Comprobante de servicio_Servicio1_idx` (`Servicio_idServicio` ASC) VISIBLE,
  CONSTRAINT `fk_Servicio_has_Comprobante de servicio_Servicio1`
    FOREIGN KEY (`Servicio_idServicio`)
    REFERENCES `db TiendaFisica`.`Servicio` (`idServicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servicio_has_Comprobante de servicio_Comprobante de servic1`
    FOREIGN KEY (`Comprobante de servicio_idComprobante de servicio`)
    REFERENCES `db TiendaFisica`.`Factura de servicio` (`idComprobante de servicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db TiendaFisica`.`Factura de servicio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db TiendaFisica`.`Factura de servicio` ;

CREATE TABLE IF NOT EXISTS `db TiendaFisica`.`Factura de servicio` (
  `idComprobante de servicio` INT NOT NULL,
  `Detalle` VARCHAR(45) NULL,
  `Costo` VARCHAR(45) NULL,
  `Cliente_idCliente1` INT NOT NULL,
  `Cliente_Categoria_Cliente_idCategoria_Cliente1` INT NOT NULL,
  PRIMARY KEY (`idComprobante de servicio`, `Cliente_idCliente1`, `Cliente_Categoria_Cliente_idCategoria_Cliente1`),
  INDEX `fk_Factura de servicio_Cliente2_idx` (`Cliente_idCliente1` ASC, `Cliente_Categoria_Cliente_idCategoria_Cliente1` ASC) VISIBLE,
  CONSTRAINT `fk_Factura de servicio_Cliente2`
    FOREIGN KEY (`Cliente_idCliente1` , `Cliente_Categoria_Cliente_idCategoria_Cliente1`)
    REFERENCES `db TiendaFisica`.`Cliente` (`idCliente` , `Categoria_Cliente_idCategoria_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db TiendaFisica`.`Factura-de-Compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db TiendaFisica`.`Factura-de-Compra` ;

CREATE TABLE IF NOT EXISTS `db TiendaFisica`.`Factura-de-Compra` (
  `idFactura-de-Compra` INT NOT NULL,
  `Fecha-compra` DATE NULL,
  `Total_a_Pagar` DOUBLE NULL,
  `Proveedor_idProveedor` INT NOT NULL,
  PRIMARY KEY (`idFactura-de-Compra`, `Proveedor_idProveedor`),
  INDEX `fk_Factura-de-Compra_Proveedor1_idx` (`Proveedor_idProveedor` ASC) VISIBLE,
  CONSTRAINT `fk_Factura-de-Compra_Proveedor1`
    FOREIGN KEY (`Proveedor_idProveedor`)
    REFERENCES `db TiendaFisica`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db TiendaFisica`.`Factura_de_Venta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db TiendaFisica`.`Factura_de_Venta` ;

CREATE TABLE IF NOT EXISTS `db TiendaFisica`.`Factura_de_Venta` (
  `idFactura_de_Venta` INT NOT NULL,
  `Fecha` DATE NULL,
  `Total_a_Pagar` INT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Cliente_Categoria_Cliente_idCategoria_Cliente` INT NOT NULL,
  PRIMARY KEY (`idFactura_de_Venta`, `Cliente_idCliente`, `Cliente_Categoria_Cliente_idCategoria_Cliente`),
  INDEX `fk_Factura_de_Venta_Cliente1_idx` (`Cliente_idCliente` ASC, `Cliente_Categoria_Cliente_idCategoria_Cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Factura_de_Venta_Cliente1`
    FOREIGN KEY (`Cliente_idCliente` , `Cliente_Categoria_Cliente_idCategoria_Cliente`)
    REFERENCES `db TiendaFisica`.`Cliente` (`idCliente` , `Categoria_Cliente_idCategoria_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db TiendaFisica`.`Producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db TiendaFisica`.`Producto` ;

CREATE TABLE IF NOT EXISTS `db TiendaFisica`.`Producto` (
  `idProducto` INT NOT NULL,
  `Categoria` VARCHAR(45) NULL,
  `Cantidad-especifica` VARCHAR(45) NULL,
  `Precio-venta` VARCHAR(45) NULL,
  `Precio-compra` VARCHAR(45) NULL,
  PRIMARY KEY (`idProducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db TiendaFisica`.`Proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db TiendaFisica`.`Proveedor` ;

CREATE TABLE IF NOT EXISTS `db TiendaFisica`.`Proveedor` (
  `idProveedor` INT NOT NULL,
  `NIT` INT NOT NULL,
  `Nombre-Proveedor` VARCHAR(45) NULL,
  `Telefono-Proveedor` INT NULL,
  `Direccion-Proveedor` VARCHAR(45) NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db TiendaFisica`.`Servicio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db TiendaFisica`.`Servicio` ;

CREATE TABLE IF NOT EXISTS `db TiendaFisica`.`Servicio` (
  `idServicio` INT NOT NULL,
  `Descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idServicio`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
