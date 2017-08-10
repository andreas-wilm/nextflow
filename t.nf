foo = params.foo
bar = params.bar

process Process1 {
  publishDir "data", mode: 'copy'

  input:

  output:
    file("test.txt") into out

  when: foo

  script:
  """
  touch test.txt
  """
}

println "out>> $out [${out.hashCode()}]" 
if (bar) out = out.view {"File: $it"}


println "new>> $out [${out.hashCode()}]"
finalChannel = Channel.empty().mix(out)