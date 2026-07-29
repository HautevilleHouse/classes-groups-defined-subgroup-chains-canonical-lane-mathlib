import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean.SubgroupChainDefinitions

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

structure CentralSeries (G : Type) [Group G] where
  chain : SubgroupChain G
  centralityCondition : ∀ i, comGroup (chain.groups[i+1]) (chain.groups[i]) ≤ chain.groups[i+1]
  nilpotencyClass : ℕ

structure CentralSeriesPackage (G : Type) [Group G] where
  centralSeries : CentralSeries G
  centralWitness : Prop
  upperCentralSeriesFormula : Prop
  lowerCentralSeriesFormula : Prop

structure CentralSeriesEvidence {G : Type} [Group G] (P : CentralSeriesPackage G) where
  centralWitnessClosed : P.centralWitness
  upperCentralSeriesFormulaClosed : P.upperCentralSeriesFormula
  lowerCentralSeriesFormulaClosed : P.lowerCentralSeriesFormula

def CentralSeriesClosed {G : Type} [Group G] (P : CentralSeriesPackage G) : Prop :=
  P.centralWitness ∧ P.upperCentralSeriesFormula ∧ P.lowerCentralSeriesFormula

theorem central_series_closed_from_evidence {G : Type} [Group G]
    (P : CentralSeriesPackage G) (E : CentralSeriesEvidence P) : CentralSeriesClosed P := by
  exact And.intro E.centralWitnessClosed (And.intro E.upperCentralSeriesFormulaClosed E.lowerCentralSeriesFormulaClosed)

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse