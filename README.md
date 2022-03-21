# Information about your project

This project as a ACORN (Additive Congruential Random Number) generator made to fit in the group tapeout submission as part of the Zero to ASIC Course. 
This project was implemented according to the information here: http://acorn.wikramaratna.org/concept.html 
This ACORN generator is hardwired to have k = 16 and Modulus M = 2^12 (chosen due to the limitation on the number of GPIO output pins). However, it is highly scalable, and I was able to harden with at least k=16, M = 2^64. The area of the logic directly scales with k*M as the component that takes up the most space are the registers.  

Engineer: Zhenle Cao

Credit to Steven Goldsmith for his help on understanding Caravel and the testbenches

Credit to Matt Venn for his assistance and teaching this course! 

Credit to Roy Wikramaratna for inventing the ACORN algorithm

The tools that will test and create the aggregated design are here: https://github.com/mattvenn/multi_project_tools

# Zero to ASIC Course

This project was made as part of the [Zero to ASIC Course](https://zerotoasiccourse.com)!

# License

This project is [licensed under Apache 2](LICENSE)
