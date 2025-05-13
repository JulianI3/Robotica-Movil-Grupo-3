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
## **Datos experimentales**
Los datos para posición y velocidad que se obtubieron gracias al programa Tracker serian:
![a0aa36a9-1584-4c5a-b081-1713caa7dc02](https://github.com/user-attachments/assets/b9f6e088-f38d-40a8-8a2e-71833beba86f)
![ae0a3877-de4e-4a46-ad52-13dce332ea6c](https://github.com/user-attachments/assets/8fd7bb47-8e0b-491b-a006-9c1e03d80335)

---
## **Analisis y conclusiones**

Se puede evidenciar que para ambos casos se presenta un comportamiento de movimiento principalmente lineal, donde se presentaban pequeñas variaciones de velocidad dando una ligera velocidad angular del cuerpo del robot. 

Cabe resaltar que para el caso experimental se intenta ver el comportamiento promedio de los datos, donde se puede notar que el robot presenta marcadamente un desplazamiento lineal en la coordenada y, no obstante, por las ligeras variaciones en la velocidad angular del cuerpo se presenta un desplazamiento en la coordenada x.

Algo resaltable es para el cazo de la velocidad en el eje y se presenta el promedio de este alrededor de 15 cm/s lo cual es una velocidad promedio mayor a la calculada de forma experimental. Con lo cual se comprueba que los datos de programación del robot fuera de no dar un comportamiento constante, llega a tener resultados diferentes entre lo planteado teóricamente con el código del robot y los resultados físicos.

## 📚 **Referencias**
- Modelo cinemático directo (p. 13 de la presentación adjunta).


- Configuración geométrica (p. 12).  

---

✨ **Nota**:  
Los valores negativos en $$\( \dot{\phi}_1 \)$$ y $$\( \dot{\phi}_2 \)$$ indican que ambas ruedas giran en sentido contrario al convencionalmente positivo (ej.: movimiento hacia atrás).
