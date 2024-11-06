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