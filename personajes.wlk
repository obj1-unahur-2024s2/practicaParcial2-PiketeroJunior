class Personaje {
  const property fuerza
  var property rol
  
  method potencialOfensivo() = fuerza * 10 + rol.extra()  
  method esGroso() = self.esInteligente() or rol.esGroso(self)
  method esInteligente() 
}

class Guerrero inherits Personaje {
  method extra() = 100
  method esGroso(quien) = quien.fuerza() > 50 
}

class Cazador inherits Personaje {
  var mascota

  method extra() = mascota.potencial()
  method esGroso(quien) = mascota.esLongevo()
}

class Brujo inherits Personaje {
  method extra() = 0
  method esGroso(quien) = true
}

class Mascota inherits Personaje{
  const edad = 1
  var property tieneGarra = true

  method potencial() = fuerza * if (tieneGarra) 2 else 1
  method esLongevo() = edad > 10
}

class Orco inherits Personaje{
  override method esInteligente() = false
  override method potencialOfensivo() = super() * 1.1
}

class Humano inherits Personaje {
  const inteligencia
  override method esInteligente() = inteligencia > 50  
}

class Ejercito {
  const integrantes = []

  method invadir(localidad) {
    if( self.potenciaTotal() > localidad.potenciaTotal())
      localidad.intentaOcupar(self)
  }

  method potenciaTotal() = integrantes.sum({i => i.potencialOfensivo()})
}

class Localidad {
  var property ocupante 
  method potenciaTotal() = ocupante.potenciaTotal()

}
class Aldea inherits Localidad{
  //var property ocupante
  var tamanioMax = 3

  

  method intentaOCupar(ejercito){
    if (ejercito.cuantosIntegrantes() > tamanioMax)
      ocupante = new Ejercito(
        integrantes = ejercito.losMasFuertes(10))
    else
      ocupante = ejercito    
  } 
}

class Ciudad inherits Localidad {
  override method potenciaTotal() = super() + 300
}