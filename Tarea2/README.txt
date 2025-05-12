# Cinemática Directa de un Robot de Tracción Diferencial

## Parámetros del Robot
- **Radio de las ruedas**: \( r = 28 \, \text{mm} = 0.028 \, \text{m} \)
- **Trocha**: \( 2l = 124 \, \text{mm} \rightarrow l = 0.062 \, \text{m} \)
- **Velocidades angulares de las ruedas**:
  - Rueda izquierda: \( \dot{\phi}_1 = -4.78 \, \text{rad/s} \)
  - Rueda derecha: \( \dot{\phi}_2 = -4.77 \, \text{rad/s} \)

---

## Modelo Cinemático Directo
Las ecuaciones para la velocidad lineal (\( v \)) y angular (\( \omega \)) del robot son:

### 1. Velocidad Lineal
\[
v = \frac{r}{2} \left( \dot{\phi}_1 + \dot{\phi}_2 \right)
\]

**Sustitución de valores**:
\[
v = \frac{0.028}{2} \left( -4.78 + (-4.77) \right) = 0.014 \times (-9.55) = \boxed{-0.1337 \, \text{m/s}}
\]

*Interpretación*: El robot se desplaza hacia **atrás** a \( 0.1337 \, \text{m/s} \).

---

### 2. Velocidad Angular
\[
\omega = \frac{r}{2l} \left( \dot{\phi}_1 - \dot{\phi}_2 \right)
\]

**Sustitución de valores**:
\[
\omega = \frac{0.028}{2 \times 0.062} \left( -4.78 - (-4.77) \right) = \frac{0.028}{0.124} \times (-0.01) = 0.2258 \times (-0.01) = \boxed{-0.002258 \, \text{rad/s}}
\]

*Interpretación*: El robot gira levemente hacia la **derecha** (\( \omega \approx -0.0023 \, \text{rad/s} \)).

---

## Observaciones
- **Movimiento resultante**: Traslación hacia atrás con giro casi imperceptible.
- **Causa de la velocidad angular mínima**: La pequeña diferencia entre \( \dot{\phi}_1 \) y \( \dot{\phi}_2 \).

---

**Referencias**:
- Modelo cinemático directo (página 13 de la presentación adjunta).
- Parámetros geométricos (página 12).
