# language: es
Característica: Gestión de Pedidos Personalizados en Tienda de Ropa

  # Trazabilidad: HU-03 | RF-04
  Escenario: HU-03 - Solicitar pedido (Flujo principal)
    Dado que el cliente seleccionó una variante disponible
    Cuando registra talla, color y cantidad válidos
    Entonces el sistema registra el detalle del pedido

  Escenario: HU-03 - Solicitar pedido sin stock suficiente (Excepción)
    Dado que la variante no tiene stock suficiente
    Cuando se solicita una cantidad mayor
    Entonces el sistema informa y no agrega el detalle

  # Trazabilidad: HU-04 | RF-05
  Escenario: HU-04 - Configurar estampado (Flujo principal)
    Dado que existe un detalle personalizado
    Cuando se registran diseño, ubicación y técnica
    Entonces el sistema guarda la especificación del estampado

  Escenario: HU-04 - Avanzar a producción sin diseño (Excepción)
    Dado que falta el diseño
    Cuando se intenta pasar a producción
    Entonces el sistema bloquea el avance

  # Trazabilidad: HU-05 | RF-06
  Escenario: HU-05 - Calcular total automáticamente (Flujo principal)
    Dado que el pedido tiene detalles válidos
    Cuando se solicita el cálculo
    Entonces el sistema muestra subtotal por detalle y total

  Escenario: HU-05 - Calcular total con cantidad cero (Excepción)
    Dado que una cantidad es cero
    Cuando se solicita el cálculo
    Entonces el sistema rechaza el detalle

  # Trazabilidad: HU-06 | RF-07
  Escenario: HU-06 - Registrar abonos (Flujo principal)
    Dado que existe un saldo pendiente
    Cuando el encargado registra un abono válido
    Entonces el sistema actualiza el monto pagado y el saldo

  Escenario: HU-06 - Abono superior al saldo pendiente (Excepción)
    Dado que el monto supera el saldo
    Cuando se intenta registrar
    Entonces el sistema solicita corregirlo

  # Trazabilidad: HU-07 | RF-08
  Escenario: HU-07 - Actualizar estado del pedido (Flujo principal)
    Dado que el pedido está registrado
    Cuando el encargado selecciona un estado permitido
    Entonces el sistema guarda y muestra el nuevo estado

  Escenario: HU-07 - Retroceder estado no permitido (Excepción)
    Dado que el pedido está en "Listo"
    Cuando se intenta pasar a "Pendiente"
    Entonces el sistema rechaza el cambio

  # Trazabilidad: HU-10 | RF-10
  Escenario: HU-10 - Confirmar entrega (Flujo principal)
    Dado que el pedido se encuentra listo para ser entregado
    Cuando el encargado confirma la entrega
    Entonces el sistema registra el pedido como entregado

  Escenario: HU-10 - Confirmar entrega de pedido no listo (Excepción)
    Dado que el pedido todavía no se encuentra listo
    Cuando el encargado intenta confirmar la entrega
    Entonces el sistema no permite finalizar la entrega
