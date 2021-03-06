MODULE LennardJones

  USE ControlStructures
  USE MondoLogger
  USE Parse

  IMPLICIT NONE

CONTAINS

  SUBROUTINE LennardJonesPotential(O, G)
    TYPE(Options)    :: O
    TYPE(Geometries) :: G
    INTEGER          :: iCLONE, i, j
    REAL(DOUBLE)     :: R2, R6

    DO iCLONE = 1, G%Clones
      G%Clone(iCLONE)%ETotal = Zero
      DO i = 1, G%Clone(iCLONE)%NAtms
        DO j = i+1, G%Clone(iCLONE)%NAtms
          R2 = (G%Clone(iCLONE)%Carts%D(1, j)-G%Clone(iCLONE)%Carts%D(1, i))**2 &
             + (G%Clone(iCLONE)%Carts%D(2, j)-G%Clone(iCLONE)%Carts%D(2, i))**2 &
             + (G%Clone(iCLONE)%Carts%D(3, j)-G%Clone(iCLONE)%Carts%D(3, i))**2
          R6 = O%LennardJonesR0**2/R2
          R6= R6**3

          !CALL MondoLog(DEBUG_NONE, "LennardJones", "R = "//TRIM(DblToChar(SQRT(R2)*AUToAngstroms))//" A", &
          !  "i = "//TRIM(IntToChar(i))//", j = "//TRIM(IntToChar(j)))

          G%Clone(iCLONE)%ETotal = G%Clone(iCLONE)%ETotal + O%LennardJonesEpsilon*R6*(R6-2)
        ENDDO
      ENDDO

      CALL MondoLog(DEBUG_NONE, "LennardJones", "ETotal = " &
        //TRIM(FltToChar(G%Clone(iCLONE)%ETotal/O%LennardJonesEpsilon))//" epsilon = " &
        //TRIM(DblToChar(G%Clone(iCLONE)%ETotal*au2eV))//" eV", "Clone "//TRIM(IntToChar(iCLONE)))
    ENDDO

  END SUBROUTINE LennardJonesPotential

  SUBROUTINE LennardJonesForce(O, G)
    TYPE(Options)    :: O
    TYPE(Geometries) :: G
    INTEGER          :: iCLONE, i, j
    REAL(DOUBLE)     :: R2, R6, FMagnitude

    DO iCLONE = 1, G%Clones
      G%Clone(iCLONE)%Gradients%D = Zero
      DO i = 1, G%Clone(iCLONE)%NAtms
        DO j = 1, G%Clone(iCLONE)%NAtms
          IF(i == j) THEN
            CYCLE
          ENDIF

          R2 = (G%Clone(iCLONE)%Carts%D(1, i)-G%Clone(iCLONE)%Carts%D(1, j))**2 &
             + (G%Clone(iCLONE)%Carts%D(2, i)-G%Clone(iCLONE)%Carts%D(2, j))**2 &
             + (G%Clone(iCLONE)%Carts%D(3, i)-G%Clone(iCLONE)%Carts%D(3, j))**2
          R6 = O%LennardJonesR0**2/R2
          R6 = R6**3

          FMagnitude = -12*O%LennardJonesEpsilon/R2*R6*(R6-1)
          G%Clone(iCLONE)%Gradients%D(1, i) = G%Clone(iCLONE)%Gradients%D(1, i) + FMagnitude*(G%Clone(iCLONE)%Carts%D(1, i)-G%Clone(iCLONE)%Carts%D(1, j))
          G%Clone(iCLONE)%Gradients%D(2, i) = G%Clone(iCLONE)%Gradients%D(2, i) + FMagnitude*(G%Clone(iCLONE)%Carts%D(2, i)-G%Clone(iCLONE)%Carts%D(2, j))
          G%Clone(iCLONE)%Gradients%D(3, i) = G%Clone(iCLONE)%Gradients%D(3, i) + FMagnitude*(G%Clone(iCLONE)%Carts%D(3, i)-G%Clone(iCLONE)%Carts%D(3, j))
        ENDDO
      ENDDO

      CALL MondoLog(DEBUG_NONE, "LennardJones", "Gradient in eV/A", "Clone "//TRIM(IntToChar(iCLONE)))
      DO i = 1, G%Clone(iCLONE)%NAtms
        CALL MondoLog(DEBUG_NONE, "LennardJones", "Grad["//TRIM(IntToChar(i))//"] = " &
          //TRIM(FltToChar(G%Clone(iCLONE)%Gradients%D(1, i)*au2eV/AUToAngstroms))//" " &
          //TRIM(FltToChar(G%Clone(iCLONE)%Gradients%D(2, i)*au2eV/AUToAngstroms))//" " &
          //TRIM(FltToChar(G%Clone(iCLONE)%Gradients%D(3, i)*au2eV/AUToAngstroms)), &
          "Clone "//TRIM(IntToChar(iCLONE)))
      ENDDO
    ENDDO

  END SUBROUTINE LennardJonesForce

END MODULE LennardJones
