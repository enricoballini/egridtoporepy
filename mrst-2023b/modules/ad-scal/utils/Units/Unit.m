function unit = Unit(quantity)
% ask siroos for the docs
    quantity = lower(quantity);

    % rotational speed
    if(contains(quantity,strcat('rotational speed')) || ...
       contains(quantity,strcat('rotation speed')) || ...
       contains(quantity,strcat('centrifuge speed'))), unit = 'rad/s' ; return; 
    end
    
    % volume rate
    if(contains(quantity,strcat('volume rate')) || ...
       contains(quantity,strcat('rate')) || ...
       contains(quantity,strcat('flow rate'))), unit = 'm^3/s' ; return; 
    end
    
    % density
    if(contains(quantity,strcat('density')) || ...
       contains(quantity,strcat('rho'))), unit = 'kg/m^3' ; return; 
    end
    
    % fraction
    if(contains(quantity,strcat('saturation')) || ...
       contains(quantity,strcat('sw')) || ...
       contains(quantity,strcat('relperm')) || ...
       contains(quantity,strcat('relative permeability')) || ...
       contains(quantity,strcat('relative perm')) || ...
       contains(quantity,strcat('krw')) || ...
       contains(quantity,strcat('krnw')) || ...
       contains(quantity,strcat('kro')) || ...
       contains(quantity,strcat('porosity')) || ...
       contains(quantity,strcat('fraction')) || ...
       contains(quantity,strcat('percent')) || ...
       contains(quantity,strcat({'-'}))), unit = 'fraction' ; return; 
    end
    
    % time
    if(contains(quantity,strcat('time'))), unit = 's' ; return; end
    
    % length
    if(contains(quantity,strcat('length')) || ...
       contains(quantity,strcat('distance')) || ...
       contains(quantity,strcat('radius'))), unit = 'm' ; return; 
    end
    
    % volume
    if(contains(quantity,strcat('volume')) || ...
       contains(quantity,strcat('cum'))), unit = 'm^3' ; return; 
    end
        
    % pressure
    if(contains(quantity,strcat('pressure')) || ...
       contains(quantity,strcat('capillary pressure')) || ...
       contains(quantity,strcat('pc')) || ...
       contains(quantity,strcat('pcow'))), unit = 'Pa' ; return; 
    end          
    
    % viscosity 
    if(contains(quantity,strcat('viscosity'))), unit = 'Pa.s' ; return; end
    
    % permeability
    if(contains(quantity,strcat('permeability')) || ...
        contains(quantity,strcat('perm')) || ...
        contains(quantity,strcat('md')) || ...
        contains(quantity,strcat('m^2'))), unit = 'm^2' ; return; 
    end
    
    % acceleration 
    if (contains(quantity,strcat('acceleration'))), unit = 'm/s^2';...
            return;
    end
    
    error('Input unit system could not find, check the input unit.');
end