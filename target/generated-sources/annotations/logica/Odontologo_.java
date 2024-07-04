package logica;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Horario;
import logica.Turno;
import logica.Usuario;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-07-04T12:00:11")
@StaticMetamodel(Odontologo.class)
public class Odontologo_ extends Persona_ {

    public static volatile SingularAttribute<Odontologo, Horario> un_horario;
    public static volatile ListAttribute<Odontologo, Turno> lista_turnos;
    public static volatile SingularAttribute<Odontologo, Usuario> un_usuario;
    public static volatile SingularAttribute<Odontologo, String> especialidad;

}