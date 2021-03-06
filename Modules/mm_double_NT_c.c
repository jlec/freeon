/*
**
** PHiPAC Matrix-Matrix Code for the operation:
**    C = alpha*A*transpose(B) + beta*C
**
** Automatically Generated by mm_cgen ($Revision: 1.1 $) using the command:
**    ./mm_cgen -prec double -opA N -opB T -alpha c -ignore_m1 -sp 2ma -l0 1 4 3 -file ./src/mm_double_NT_c.c -routine_name mm_double_NT_c -beta c 
**
** Run './mm_cgen -help' for help.
**
** Generated on: Friday October 20 2000, 19:26:29 MDT
** Created by: Jeff Bilmes <bilmes@cs.berkeley.edu>
**             http://www.icsi.berkeley.edu/~bilmes/phipac
**
**
** Routine Usage: General (M,K,N) = (M, K, N) matrix multiply: Two stage software pipe [load, mul-add]
**    mm_double_NT_c(const int M, const int K, const int N, const double *const A, const double *const B, double *const C, const int Astride, const int Bstride, const int Cstride, const double alpha, const double beta)
** where
**  A is an MxK matrix
**  transpose(B) is an KxN matrix
**  C is an MxN matrix
**  Astride is the number of entries between the start of each row of A
**  Bstride is the number of entries between the start of each row of B
**  Cstride is the number of entries between the start of each row of C
**
**
** "Copyright (c) 1995 The Regents of the University of California.  All
** rights reserved."  Permission to use, copy, modify, and distribute
** this software and its documentation for any purpose, without fee, and
** without written agreement is hereby granted, provided that the above
** copyright notice and the following two paragraphs appear in all copies
** of this software.
**
** IN NO EVENT SHALL THE UNIVERSITY OF CALIFORNIA BE LIABLE TO ANY PARTY FOR
** DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING OUT
** OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF THE UNIVERSITY OF
** CALIFORNIA HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
** THE UNIVERSITY OF CALIFORNIA SPECIFICALLY DISCLAIMS ANY WARRANTIES,
** INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
** AND FITNESS FOR A PARTICULAR PURPOSE.  THE SOFTWARE PROVIDED HEREUNDER IS
** ON AN "AS IS" BASIS, AND THE UNIVERSITY OF CALIFORNIA HAS NO OBLIGATION TO
** PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
**
*/

/*
 * General (M,K,N) = (M, K, N) matrix multiply: Two stage software pipe [load, mul-add]
 */

#define NO_MB

void
mm_double_NT_c(const int M, const int K, const int N, const double *const A, const double *const B, double *const C, const int Astride, const int Bstride, const int Cstride, const double alpha, const double beta)
{
   const double *a;
   const double *b;
   double *c;
   const double *ap_0;
   const double *bp_0,*bp_1,*bp_2;
   double *cp;
   const int A_sbs_stride = Astride*1;
   const int B_sbs_stride = Bstride*3;
   const int C_sbs_stride = Cstride*1;
   const int k_marg_el = ((K>=5)?((K-1)&3):K);
   const int k_norm = K - k_marg_el;
   const int m_marg_el = M & 0;
   const int m_norm = M - m_marg_el;
   const int n_marg_el = N % 3;
   const int n_norm = N - n_marg_el;
   double *const c_endp = C+m_norm*Cstride;
   register double c0_0,c0_1,c0_2;
   register double t0_0,t0_1,t0_2;
   if (beta == 0.0) {
      double *cprb,*cpre,*cp,*cpe;
      cpre = C + M*Cstride;
      for (cprb = C; cprb != cpre; cprb += Cstride) {
         cpe = cprb + N;
         for (cp = cprb; cp != cpe; cp++) {
            *cp = 0.0;
         }
      }
   } else if (beta != 1.0) {
      double *cprb,*cpre,*cp,*cpe;
      cpre = C + M*Cstride;
      for (cprb = C; cprb != cpre; cprb += Cstride) {
         cpe = cprb + N;
         for (cp = cprb; cp != cpe; cp++) {
            *cp *= (beta);
         }
      }
   }
   for (c=C,a=A; c!= c_endp; c+=C_sbs_stride,a+=A_sbs_stride) {
      const double* const ap_endp = a + k_norm;
      double* const cp_endp = c + n_norm;
      for (b=B,cp=c; cp!=cp_endp; b+=B_sbs_stride,cp+=3) {
         register double _b0,_b1,_b2;
         register double _a0;
         double *_cp;
         ap_0 = a;
         bp_0 = b;
         bp_1 = bp_0 + Bstride;
         bp_2 = bp_1 + Bstride;
         c0_0 = 0.0; c0_1 = 0.0; c0_2 = 0.0; 
         if (K >= 5) {
            _b0 = bp_0[0];_b1 = bp_1[0];_b2 = bp_2[0];_a0 = ap_0[0];
            bp_0+=1;bp_1+=1;bp_2+=1;
            ap_0+=1;
            do {
               t0_0=_a0*_b0;t0_1=_a0*_b1;t0_2=_a0*_b2;
               c0_0+=t0_0;c0_1+=t0_1;c0_2+=t0_2;
               _b0 = bp_0[0];_b1 = bp_1[0];_b2 = bp_2[0];_a0 = ap_0[0];
               t0_0=_a0*_b0;t0_1=_a0*_b1;t0_2=_a0*_b2;
               c0_0+=t0_0;c0_1+=t0_1;c0_2+=t0_2;
               _b0 = bp_0[1];_b1 = bp_1[1];_b2 = bp_2[1];_a0 = ap_0[1];
               t0_0=_a0*_b0;t0_1=_a0*_b1;t0_2=_a0*_b2;
               c0_0+=t0_0;c0_1+=t0_1;c0_2+=t0_2;
               _b0 = bp_0[2];_b1 = bp_1[2];_b2 = bp_2[2];_a0 = ap_0[2];
               t0_0=_a0*_b0;t0_1=_a0*_b1;t0_2=_a0*_b2;
               c0_0+=t0_0;c0_1+=t0_1;c0_2+=t0_2;
               _b0 = bp_0[3];_b1 = bp_1[3];_b2 = bp_2[3];_a0 = ap_0[3];
               ap_0+=4;
               bp_0+=4;bp_1+=4;bp_2+=4;
            } while (ap_0 != ap_endp);
            t0_0=_a0*_b0;t0_1=_a0*_b1;t0_2=_a0*_b2;
            c0_0+=t0_0;c0_1+=t0_1;c0_2+=t0_2;
         }
         if (k_marg_el & 0x4) {
            /* Fixed M,K,N = 1,4,3 fully-unrolled matrix matrix multiply. */
            
            _b0 = bp_0[0]; _b1 = bp_1[0]; _b2 = bp_2[0]; 
            _a0 = ap_0[0];
            c0_0 += _a0*_b0; c0_1 += _a0*_b1; c0_2 += _a0*_b2; 
            
            _b0 = bp_0[1]; _b1 = bp_1[1]; _b2 = bp_2[1]; 
            _a0 = ap_0[1];
            c0_0 += _a0*_b0; c0_1 += _a0*_b1; c0_2 += _a0*_b2; 
            
            _b0 = bp_0[2]; _b1 = bp_1[2]; _b2 = bp_2[2]; 
            _a0 = ap_0[2];
            c0_0 += _a0*_b0; c0_1 += _a0*_b1; c0_2 += _a0*_b2; 
            
            _b0 = bp_0[3]; _b1 = bp_1[3]; _b2 = bp_2[3]; 
            _a0 = ap_0[3];
            c0_0 += _a0*_b0; c0_1 += _a0*_b1; c0_2 += _a0*_b2; 

            ap_0+=4;
            bp_0+=4;bp_1+=4;bp_2+=4;
         }
         if (k_marg_el & 0x2) {
            /* Fixed M,K,N = 1,2,3 fully-unrolled matrix matrix multiply. */
            
            _b0 = bp_0[0]; _b1 = bp_1[0]; _b2 = bp_2[0]; 
            _a0 = ap_0[0];
            c0_0 += _a0*_b0; c0_1 += _a0*_b1; c0_2 += _a0*_b2; 
            
            _b0 = bp_0[1]; _b1 = bp_1[1]; _b2 = bp_2[1]; 
            _a0 = ap_0[1];
            c0_0 += _a0*_b0; c0_1 += _a0*_b1; c0_2 += _a0*_b2; 

            ap_0+=2;
            bp_0+=2;bp_1+=2;bp_2+=2;
         }
         if (k_marg_el & 0x1) {
            /* Fixed M,K,N = 1,1,3 fully-unrolled matrix matrix multiply. */
            
            _b0 = bp_0[0]; _b1 = bp_1[0]; _b2 = bp_2[0]; 
            _a0 = ap_0[0];
            c0_0 += _a0*_b0; c0_1 += _a0*_b1; c0_2 += _a0*_b2; 

         }
         _cp=cp;_cp[0]+=alpha*c0_0;_cp[1]+=alpha*c0_1;_cp[2]+=alpha*c0_2;
      }
   }
   for (c=C,a=A; c!= c_endp; c+=C_sbs_stride,a+=A_sbs_stride) {
      const double* const ap_endp = a + k_norm;
      b = B+n_norm*Bstride;
      cp = c+n_norm;
      if (n_marg_el & 0x2) {
         register double _b0,_b1;
         register double _a0;
         double *_cp;
         ap_0 = a;
         bp_0 = b;
         bp_1 = bp_0 + Bstride;
         c0_0 = 0.0; c0_1 = 0.0; 
         if (K >= 5) {
            _b0 = bp_0[0];_b1 = bp_1[0];_a0 = ap_0[0];
            bp_0+=1;bp_1+=1;
            ap_0+=1;
            do {
               t0_0=_a0*_b0;t0_1=_a0*_b1;
               c0_0+=t0_0;c0_1+=t0_1;
               _b0 = bp_0[0];_b1 = bp_1[0];_a0 = ap_0[0];
               t0_0=_a0*_b0;t0_1=_a0*_b1;
               c0_0+=t0_0;c0_1+=t0_1;
               _b0 = bp_0[1];_b1 = bp_1[1];_a0 = ap_0[1];
               t0_0=_a0*_b0;t0_1=_a0*_b1;
               c0_0+=t0_0;c0_1+=t0_1;
               _b0 = bp_0[2];_b1 = bp_1[2];_a0 = ap_0[2];
               t0_0=_a0*_b0;t0_1=_a0*_b1;
               c0_0+=t0_0;c0_1+=t0_1;
               _b0 = bp_0[3];_b1 = bp_1[3];_a0 = ap_0[3];
               ap_0+=4;
               bp_0+=4;bp_1+=4;
            } while (ap_0 != ap_endp);
            t0_0=_a0*_b0;t0_1=_a0*_b1;
            c0_0+=t0_0;c0_1+=t0_1;
         }
         if (k_marg_el & 0x4) {
            /* Fixed M,K,N = 1,4,2 fully-unrolled matrix matrix multiply. */
            
            _b0 = bp_0[0]; _b1 = bp_1[0]; 
            _a0 = ap_0[0];
            c0_0 += _a0*_b0; c0_1 += _a0*_b1; 
            
            _b0 = bp_0[1]; _b1 = bp_1[1]; 
            _a0 = ap_0[1];
            c0_0 += _a0*_b0; c0_1 += _a0*_b1; 
            
            _b0 = bp_0[2]; _b1 = bp_1[2]; 
            _a0 = ap_0[2];
            c0_0 += _a0*_b0; c0_1 += _a0*_b1; 
            
            _b0 = bp_0[3]; _b1 = bp_1[3]; 
            _a0 = ap_0[3];
            c0_0 += _a0*_b0; c0_1 += _a0*_b1; 

            ap_0+=4;
            bp_0+=4;bp_1+=4;
         }
         if (k_marg_el & 0x2) {
            /* Fixed M,K,N = 1,2,2 fully-unrolled matrix matrix multiply. */
            
            _b0 = bp_0[0]; _b1 = bp_1[0]; 
            _a0 = ap_0[0];
            c0_0 += _a0*_b0; c0_1 += _a0*_b1; 
            
            _b0 = bp_0[1]; _b1 = bp_1[1]; 
            _a0 = ap_0[1];
            c0_0 += _a0*_b0; c0_1 += _a0*_b1; 

            ap_0+=2;
            bp_0+=2;bp_1+=2;
         }
         if (k_marg_el & 0x1) {
            /* Fixed M,K,N = 1,1,2 fully-unrolled matrix matrix multiply. */
            
            _b0 = bp_0[0]; _b1 = bp_1[0]; 
            _a0 = ap_0[0];
            c0_0 += _a0*_b0; c0_1 += _a0*_b1; 

         }
         _cp=cp;_cp[0]+=alpha*c0_0;_cp[1]+=alpha*c0_1;
         b+=Bstride*2;
         cp+=2;
      }
      if (n_marg_el & 0x1) {
         register double _b0;
         register double _a0;
         double *_cp;
         ap_0 = a;
         bp_0 = b;
         c0_0 = 0.0; 
         if (K >= 5) {
            _b0 = bp_0[0];_a0 = ap_0[0];
            bp_0+=1;
            ap_0+=1;
            do {
               t0_0=_a0*_b0;
               c0_0+=t0_0;
               _b0 = bp_0[0];_a0 = ap_0[0];
               t0_0=_a0*_b0;
               c0_0+=t0_0;
               _b0 = bp_0[1];_a0 = ap_0[1];
               t0_0=_a0*_b0;
               c0_0+=t0_0;
               _b0 = bp_0[2];_a0 = ap_0[2];
               t0_0=_a0*_b0;
               c0_0+=t0_0;
               _b0 = bp_0[3];_a0 = ap_0[3];
               ap_0+=4;
               bp_0+=4;
            } while (ap_0 != ap_endp);
            t0_0=_a0*_b0;
            c0_0+=t0_0;
         }
         if (k_marg_el & 0x4) {
            /* Fixed M,K,N = 1,4,1 fully-unrolled matrix matrix multiply. */
            
            _b0 = bp_0[0]; 
            _a0 = ap_0[0];
            c0_0 += _a0*_b0; 
            
            _b0 = bp_0[1]; 
            _a0 = ap_0[1];
            c0_0 += _a0*_b0; 
            
            _b0 = bp_0[2]; 
            _a0 = ap_0[2];
            c0_0 += _a0*_b0; 
            
            _b0 = bp_0[3]; 
            _a0 = ap_0[3];
            c0_0 += _a0*_b0; 

            ap_0+=4;
            bp_0+=4;
         }
         if (k_marg_el & 0x2) {
            /* Fixed M,K,N = 1,2,1 fully-unrolled matrix matrix multiply. */
            
            _b0 = bp_0[0]; 
            _a0 = ap_0[0];
            c0_0 += _a0*_b0; 
            
            _b0 = bp_0[1]; 
            _a0 = ap_0[1];
            c0_0 += _a0*_b0; 

            ap_0+=2;
            bp_0+=2;
         }
         if (k_marg_el & 0x1) {
            /* Fixed M,K,N = 1,1,1 fully-unrolled matrix matrix multiply. */
            
            _b0 = bp_0[0]; 
            _a0 = ap_0[0];
            c0_0 += _a0*_b0; 

         }
         _cp=cp;_cp[0]+=alpha*c0_0;
      }
   }
}
