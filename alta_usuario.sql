DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `alta_usuario`(
	in _idUsuario int, 
    in _usuario varchar(45),
    in _correo varchar (45),
    in _contraseña varchar (45),
    in accion varchar(45)
)
BEGIN
	case accion when 'nuevo' then
    insert into usuario (usuario, correo, contraseña)
    values (_usuario,_correo,_contraseña);
    end case;
    
    case accion when 'actualizar' then
    update usuario set correo=_correo,contraseña=_contraseña
    where usuario=_usuario;
    end case;
    
    case accion when 'eliminar' then 
    delete from usuario where usuario=_usuario;
    end case;
    
    case accion when 'consultar' then
    select * from usuario where usuario=_usuario;
    end case;
    
END$$
DELIMITER ;
