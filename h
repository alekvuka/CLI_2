
[1mFrom:[0m /home/alekvuka/temporary/CLI_2/lib/CLI.rb @ line 125 CLI#return_validator:

    [1;34m123[0m: [32mdef[0m [1;34mreturn_validator[0m(array_or_hash)
    [1;34m124[0m: 
 => [1;34m125[0m:   binding.pry
    [1;34m126[0m:   [32mif[0m array_or_hash == [1;36mnil[0m [1;34m#|| array_or_hash.any?[0m
    [1;34m127[0m:     puts [31m[1;31m"[0m[31m======================================================================================================[1;31m"[0m[31m[0m
    [1;34m128[0m:     puts [31m[1;31m"[0m[31m!!!!!!!!   The doctor, team or specialty that you have choosen does not exit in this clinic   !!!!!!!![1;31m"[0m[31m[0m
    [1;34m129[0m:     puts [31m[1;31m"[0m[31m======================================================================================================[1;31m"[0m[31m[0m
    [1;34m130[0m:     start
    [1;34m131[0m: 
    [1;34m132[0m:   [32melsif[0m array_or_hash.instance_of? [1;34;4mArray[0m && array_or_hash.any?
    [1;34m133[0m:     puts [31m[1;31m"[0m[31m======================================================================================================[1;31m"[0m[31m[0m
    [1;34m134[0m:     puts [31m[1;31m"[0m[31m!!!!!!!!   The doctor, team or specialty that you have choosen does not exit in this clinic   !!!!!!!![1;31m"[0m[31m[0m
    [1;34m135[0m:     puts [31m[1;31m"[0m[31m======================================================================================================[1;31m"[0m[31m[0m
    [1;34m136[0m:     start
    [1;34m137[0m: 
    [1;34m138[0m:   [32mend[0m
    [1;34m139[0m: 
    [1;34m140[0m: 
    [1;34m141[0m: 
    [1;34m142[0m: [32mend[0m

