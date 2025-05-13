# 🚗 Cinemática Directa: Robot de Tracción Diferencial

Este documento calcula la velocidad lineal y angular de un robot móvil con ruedas diferenciales, utilizando el modelo cinemático directo.

---

## 📏 **Parámetros del Robot**
| **Variable**          | **Valor**               |
|-----------------------|-------------------------|
| Radio de las ruedas \( r \) | 28 mm = 0.028 m         |
| Trocha \( 2l \)    | 124 mm → $$\( l = 0.062 \, \text{m} \)$$ |
| Velocidad rueda izquierda $$\( \dot{\phi}_1 \)$$ | -4.78 rad/s |
| Velocidad rueda derecha $$\( \dot{\phi}_2 \)$$   | -4.77 rad/s |

---

## 📐 **Modelo Cinemático Directo**

### 1. **Velocidad Lineal $$\( v \)$$**
$$
v = \frac{r}{2} \left( \dot{\phi}_1 + \dot{\phi}_2 \right)
$$

**Cálculo**:

$$v = \frac{0.028}{2} \left( -4.78 + (-4.77) \right) = 0.014 \times (-9.55) = \boxed{-0.1337 \, \text{m/s}}$$

🔍 **Interpretación**:  
El robot se mueve hacia **atrás** a una velocidad de **0.134 m/s**.

---

### 2. **Velocidad Angular $$\( \omega \)$$**

$$\omega = \frac{r}{2l} \left( \dot{\phi}_1 - \dot{\phi}_2 \right)$$

**Cálculo**:

$$\omega = \frac{0.028}{2 \times 0.062} \left( -4.78 - (-4.77) \right) = \frac{0.028}{0.124} \times (-0.01) = \boxed{-0.002258 \, \text{rad/s}}$$


🔍 **Interpretación**:  
El robot gira levemente hacia la **derecha** $$\( \omega \approx -0.0023 \, \text{rad/s} \)$$.

---

## 🧠 **Análisis del Movimiento**
- **Dirección predominante**: Movimiento rectilíneo hacia atrás.  
- **Giro mínimo**: La diferencia de velocidad entre las ruedas es casi nula $$\( \Delta \dot{\phi} = 0.01 \, \text{rad/s} \)$$, lo que genera un radio de giro muy grande.  
- **Implicación práctica**: El robot sigue una trayectoria casi recta con una desviación insignificante.
---
## **Datos experomentales**
Los datos para posición y velocidad que se obtubieron gracias al programa Tracker serian:

---

## 📚 **Referencias**
- Modelo cinemático directo (p. 13 de la presentación adjunta).  
- Configuración geométrica (p. 12).  

---

✨ **Nota**:  
Los valores negativos en $$\( \dot{\phi}_1 \)$$ y $$\( \dot{\phi}_2 \)$$ indican que ambas ruedas giran en sentido contrario al convencionalmente positivo (ej.: movimiento hacia atrás).
