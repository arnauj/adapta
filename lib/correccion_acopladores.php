
<?php
    //Solución propuesta acopladores

    //Cambios realizados:

    //Para abordar la "envidia de características", hemos movido la responsabilidad de imprimir la información del producto en la factura desde el método imprimirFactura() de la clase Factura a un nuevo método llamado imprimirLineaProducto(). De esta manera, separamos las responsabilidades y hacemos que el método imprimirFactura() se enfoque únicamente en imprimir la factura en sí, delegando la impresión de la información del producto al nuevo método imprimirLineaProducto().
    //Al hacer este cambio, se mejora la estructura y organización del código, mientras se mantiene la funcionalidad original del programa.

  class Producto {
    private $nombre;
    private $precio;

    public function __construct($nombre, $precio) {
      $this->nombre = $nombre;
      $this->precio = $precio;
    }

    public function getNombre() {
      return $this->nombre;
    }

    public function getPrecio() {
      return $this->precio;
    }
  }

  class Carrito {
    private $productos;

    public function __construct() {
      $this->productos = [];
    }

    public function agregarProducto(Producto $producto) {
      $this->productos[] = $producto;
    }

    public function getProductos() {
      return $this->productos;
    }

    public function calcularTotal() {
      $total = 0;
      foreach ($this->productos as $producto) {
        $total += $producto->getPrecio();
      }
      return $total;
    }
  }

  class Factura {
    private $carrito;

    public function __construct(Carrito $carrito) {
      $this->carrito = $carrito;
    }

    public function imprimirLineaProducto(Producto $producto) {
      echo $producto->getNombre() . ": $" . $producto->getPrecio() . "\n";
    }

    public function imprimirFactura() {
      $total = $this->carrito->calcularTotal();
      echo "Factura:\n";
      foreach ($this->carrito->getProductos() as $producto) {
        $this->imprimirLineaProducto($producto);
      }
      echo "Total: $" . $total . "\n";
    }
  }
?>
