# Swift

[Swift](http://swift-lang.org/main/index.php) (Distinto del lenguaje de programación de Apple) Es un lenguaje de programación para expresar, mediante
scripts, la ejecución concurrente de programas ordinarios:

```swift
foreach protein in proteinList {
  runBLAST(protein);
}
```
Puede verse como un lenguaje de Shell mas estructurado el cual permite escribir workflows de una manera portable: el mismo script puede correr en computadores multinucleo, clústers, nubes, grids, y supercomputadores. Ha sido usado en en proyectos para el modelado de [clima](http://swift-lang.org/case_studies/CIM-Earth.php), [estructura de proteinas](http://swift-lang.org/case_studies/Protein-Structure.php), entre otras. 

## Instalación [Ya debe estar en el cluster]
Debe estar presente al menos Java 8.

```bash
$ wget http://swift-lang.org/packages/swift-0.96.2.tar.gz
$ tar xfz swift-0.96.2.tar.gz
$ export PATH=$PATH:$(pwd)/swift-0.96.2/bin
$ swift -version
```

## Ejecutando una prueba

```bash
$ wget http://swift-lang.org/guides/release-0.96/quickstart/hello.swift
$ swift hello.swift
```

# Usando R y HTCondor

# Resumen
 - Swift scripts are text files ending in .swift The swift command runs on any host, and executes these scripts. swift is a Java application, which you can install almost anywhere. On Linux, just unpack the distribution tar file and add its bin/ directory to your PATH.
 - Swift scripts run ordinary applications, just like shell scripts do. Swift makes it easy to run these applications on parallel and remote computers (from laptops to supercomputers). If you can ssh to the system, Swift can likely run applications there.
 - The details of where to run applications and how to get files back and forth are described in configuration files separate from your program. Swift speaks ssh, PBS, Condor, SLURM, LSF, SGE, Cobalt, and Globus to run applications, and scp, http, ftp, and GridFTP to move data.
 - The Swift language has 5 main data types: boolean, int, string, float, and file. Collections of these are dynamic, sparse arrays of arbitrary dimension and structures of scalars and/or arrays defined by the type declaration.
 - Swift file variables are "mapped" to external files. Swift sends files to and from remote systems for you automatically.
 - Swift variables are "single assignment": once you set them you can not change them (in a given block of code). This makes Swift a natural, "parallel data flow" language. This programming model keeps your workflow scripts simple and easy to write and understand.
 - Swift lets you define functions to "wrap" application programs, and to cleanly structure more complex scripts. Swift app functions take files and parameters as inputs and return files as outputs.
 - A compact set of built-in functions for string and file manipulation, type conversions, high level IO, etc. is provided. Swift’s equivalent of printf() is tracef(), with limited and slightly different format codes.
 - Swift’s parallel foreach {} statement is the workhorse of the language, and executes all iterations of the loop concurrently. The actual number of parallel tasks executed is based on available resources and settable "throttles".
 - Swift conceptually executes all the statements, expressions and function calls in your program in parallel, based on data flow. These are similarly throttled based on available resources and settings.
 - Swift also has if and switch statements for conditional execution. These are seldom needed in simple workflows but they enable very dynamic workflow patterns to be specified.


# Recursos
[Tutorial](http://swift-lang.org/swift-tutorial/doc/tutorial.html)
[Código fuente del tutorial](https://github.com/swift-lang/swift-tutorial.git)
[Otro](https://support.opensciencegrid.org/support/solutions/articles/5000639800-swift)
[Paperl sobre el lenguaje]http://swift-lang.org/papers/pdfs/SwiftLanguageForDistributedParallelScripting.pdf
